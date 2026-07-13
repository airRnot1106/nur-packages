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

  # tree-sitter-language-pack's build.rs unconditionally tries to download a
  # parser-sources tarball from GitHub, even though uncomment doesn't set
  # TSLP_LANGUAGES and therefore never needs it (grammars are fetched at
  # runtime instead). Network access isn't available in the Nix build sandbox.
  env.TSLP_OFFLINE = "1";

  doCheck = false;

  meta = {
    description = "Fast CLI to remove comments from code using tree-sitter grammers";
    homepage = "https://github.com/goldziher/uncomment";
    changelog = "https://github.com/goldziher/uncomment/blob/v${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "uncomment";
  };
})
