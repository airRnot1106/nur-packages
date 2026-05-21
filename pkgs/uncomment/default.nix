{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "uncomment";
  version = "3.0.3";

  src = fetchFromGitHub {
    owner = "goldziher";
    repo = "uncomment";
    tag = "v${finalAttrs.version}";
    hash = "sha256-A76V1XA0aPsBGBMDVfjyOHLcf/6HOAK8AtXvqOVSw7E=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-vwBIiwN2SMkIeEQBYc2BoC04mHxtfs4oKM6LKa1qdUA=";

  doCheck = false;

  meta = {
    description = "Fast CLI to remove comments from code using tree-sitter grammers";
    homepage = "https://github.com/goldziher/uncomment";
    changelog = "https://github.com/goldziher/uncomment/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "uncomment";
  };
})
