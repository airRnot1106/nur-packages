{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "cell";
  version = "0.5.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "garritfra";
    repo = "cell";
    tag = "v${finalAttrs.version}";
    hash = "sha256-J13D46ttG7KlePyFZYxqjaMF7ZR5m3nTJ8/GLm4VH5o=";
  };

  cargoHash = "sha256-ZQXyt/hL6wamGrFvmrShoUCTSGAo8V5CuejAzO5oCuU=";

  meta = {
    description = "Fast terminal spreadsheet editor with Vim keybindings";
    homepage = "https://github.com/garritfra/cell";
    changelog = "https://github.com/garritfra/cell/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "cell";
  };
})
