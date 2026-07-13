{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "uncomment";
  version = "3.4.0";

  src = fetchFromGitHub {
    owner = "goldziher";
    repo = "uncomment";
    tag = "v${finalAttrs.version}";
    hash = "sha256-e8dnUHJDu5/ge1ZVNcZrxro/YoMISUKuJ5dUMRwDVM8=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-JDapUA8YJrQ76DuJa0hOqlRS+os1pZXD6/M1ZoeD/3U=";

  doCheck = false;

  meta = {
    description = "Fast CLI to remove comments from code using tree-sitter grammers";
    homepage = "https://github.com/goldziher/uncomment";
    changelog = "https://github.com/goldziher/uncomment/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "uncomment";
  };
})
