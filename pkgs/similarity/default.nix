{
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  ...
}:
pkgs.similarity.overrideAttrs (
  finalAttrs: oldAttrs: {
    version = "0.4.2";
    src = fetchFromGitHub {
      owner = "mizchi";
      repo = "similarity";
      tag = "v${finalAttrs.version}";
      sha256 = "sha256-/rvLl2SaeB0AHEbjkT/XTvVZHHoRaau44SteImRWguE=";
    };

    cargoDeps = rustPlatform.fetchCargoVendor {
      inherit (finalAttrs) src;
      hash = "sha256-d2PZ65uudYPZv1ZtILF+7Zt+sv4LcZKUkeFLQkk7uPA=";
    };

    doCheck = false;
  }
)
