{
  lib,
  stdenv,
  buildGoModule,
  fetchFromGitHub,
  fetchurl,
  nodejs,
  pnpm_10,
  fetchPnpmDeps,
  pnpmConfigHook,
  unzip,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "pumlv";
  version = "0.3.4";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "rin2yh";
    repo = "pumlv";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NM5U4wtVxG7T4RoJJUuhUSNgmZYvMtRYe8/HCdUFkf8=";
  };

  plantuml-core = fetchurl {
    url = "https://github.com/plantuml/plantuml/releases/download/snapshot/js-plantuml-SNAPSHOT.zip";
    hash = "sha256-8HJPIqE96OPUoQKZCkjCDEnSXwHCCc51hTd37egAnS8=";
  };

  frontend = stdenv.mkDerivation (frontendAttrs: {
    pname = "${finalAttrs.pname}-frontend";
    inherit (finalAttrs) version src;

    sourceRoot = "${finalAttrs.src.name}/internal/frontend";

    pnpmDeps = fetchPnpmDeps {
      inherit (frontendAttrs)
        pname
        version
        src
        sourceRoot
        ;
      pnpm = pnpm_10;
      fetcherVersion = 3;
      hash = "sha256-km8dn+5YZj+uakzpmMma3kYn71iQP3IdFNHsQuzBG7A=";
    };

    nativeBuildInputs = [
      nodejs
      pnpm_10
      pnpmConfigHook
      unzip
    ];

    __darwinAllowLocalNetworking = true;

    buildPhase = ''
      runHook preBuild

      mkdir -p public/plantuml
      unzip -o ${finalAttrs.plantuml-core} plantuml.js viz-global.js -d public/plantuml
      substituteInPlace public/plantuml/plantuml.js \
        --replace-fail '4096.0' '65536.0'

      substituteInPlace vite.config.ts \
        --replace-fail '"../static/dist"' '"dist"'

      pnpm build

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      cp -r dist $out
      runHook postInstall
    '';
  });

  # go.mod requires go 1.26.2 but nixpkgs ships 1.26.1; the gap is a patch
  # release, so relax the directive to build with the available toolchain.
  postPatch = ''
    substituteInPlace go.mod \
      --replace-fail 'go 1.26.2' 'go 1.26.1'
  '';

  preBuild = ''
    cp -r ${finalAttrs.frontend} internal/static/dist
  '';

  vendorHash = "sha256-iA4XPHC9UK/bktwfuwKSd0zO5als7IMVeVRBKYz5DoA=";

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/rin2yh/pumlv/version.Version=${finalAttrs.version}"
    "-X=github.com/rin2yh/pumlv/version.Revision=${finalAttrs.src.rev}"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Go-based local PlantUML preview server";
    homepage = "https://github.com/rin2yh/pumlv";
    changelog = "https://github.com/rin2yh/pumlv/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "pumlv";
  };
})
