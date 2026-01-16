{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "pim";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "airRnot1106";
    repo = "pim";
    tag = "v${finalAttrs.version}";
    hash = "sha256-cudN5lB0jLgG21cYAearbWylJ1N0vlX82Z6N6LRTt7U=";
  };

  cargoHash = "sha256-CfNRB8AfitOP6RwR5bZQq3a64jRWeYDZMV3Yjwlfcy8=";

  meta = {
    description = "Pim is a lightweight converter for CSS units";
    homepage = "https://github.com/airRnot1106/pim";
    license = lib.licenses.mit;
    mainProgram = "pim";
  };
})
