{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "uncomment";
  version = "3.5.0";

  src = fetchFromGitHub {
    owner = "goldziher";
    repo = "uncomment";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8MUYt7p8UQVuhn/n+ZzD/Qa4VIaDxsBAmN9eBIga/+E=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-0n8zxwJp/ITI4UKkmMpCwNoSSy6Kf97Pb74A9Nb4u3I=";

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
