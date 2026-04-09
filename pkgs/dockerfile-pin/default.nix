{
  lib,
  buildGoModule,
  fetchFromGitHub,
  makeWrapper,
  docker-credential-helpers,
}:

buildGoModule (finalAttrs: {
  pname = "dockerfile-pin";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "azu";
    repo = "dockerfile-pin";
    tag = "v${finalAttrs.version}";
    hash = "sha256-L1Rfb7U/hqk0lpM07+2FYdT/d/sg6ZFJtWx6R6MSDHE=";
  };

  vendorHash = "sha256-CgMFIYoM+nWiZ5NXtTlXHhrjzVYxoVg0YVpQq3LLrjI=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/azu/dockerfile-pin/cmd.version=${finalAttrs.version}"
  ];

  nativeBuildInputs = [ makeWrapper ];

  postFixup = ''
    wrapProgram $out/bin/dockerfile-pin \
      --prefix PATH : ${lib.makeBinPath [ docker-credential-helpers ]}
  '';

  doCheck = false;

  meta = {
    description = "A CLI tool for digest pinning — adds @sha256:<digest> to Dockerfile, docker-compose.yml, and GitHub Actions to prevent supply chain attacks";
    homepage = "https://github.com/azu/dockerfile-pin";
    changelog = "https://github.com/azu/dockerfile-pin/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "dockerfile-pin";
  };
})
