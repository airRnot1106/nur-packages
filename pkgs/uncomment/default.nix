{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "uncomment";
  version = "2.10.4";

  src = fetchFromGitHub {
    owner = "goldziher";
    repo = "uncomment";
    tag = "v${finalAttrs.version}";
    hash = "sha256-YDRToHj3KMGcrWSPxoFGtZs8ahdUqY/KAWg+76rXBVE=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-qBI8N6c3LAnWEoCGGjm5qZn4URN0akyXo0A3oZ2bIm4=";

  doCheck = false;

  meta = {
    description = "Blazingly fast CLI to remove comments from code using tree-sitter grammers";
    homepage = "https://github.com/goldziher/uncomment";
    changelog = "https://github.com/goldziher/uncomment/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "uncomment";
  };
})
