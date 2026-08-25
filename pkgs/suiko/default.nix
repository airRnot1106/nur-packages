{
  lib,
  rustPlatform,
  fetchFromGitHub,
  fetchurl,
  unzip,
  nix-update-script,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "suiko";
  version = "0.3.3";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "nwiizo";
    repo = "suiko";
    tag = "v${finalAttrs.version}";
    hash = "sha256-3x8U21cnstOUM9U5WjPIDmyAH/Lv6SDoBR1Tf2iFrTc=";
  };

  cargoHash = "sha256-4R5F+g89OXDmvWT/0nJdBVyLmmIDJQoTAAYdCmWmDkw=";

  sudachiDict = fetchurl {
    url = "https://d2ej7fkh96fzlu.cloudfront.net/sudachidict/sudachi-dictionary-20260723-core.zip";
    hash = "sha256-tug19jRA+XR0wtpF2AlQ9zdG5jLkC7/BaLQEFykTXh8=";
  };

  nativeBuildInputs = [ unzip ];

  preBuild = ''
    unzip -p ${finalAttrs.sudachiDict} '*/system_core.dic' > "$NIX_BUILD_TOP/system_core.dic"
    export SUIKO_SUDACHI_DICT="$NIX_BUILD_TOP/system_core.dic"
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Deterministic diagnostics for natural and readable Japanese writing";
    homepage = "https://github.com/nwiizo/suiko";
    changelog = "https://github.com/nwiizo/suiko/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "suiko";
  };
})
