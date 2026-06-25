{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  python3,
  zstd,
  nix-update-script,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "moine";
  version = "0.2.1";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "tagucci";
    repo = "moine";
    tag = "v${finalAttrs.version}";
    hash = "sha256-PXy2uoHXgbpgi/1492HEWpUUdQG2RPsBz9ljAZC8H1o=";
  };

  cargoHash = "sha256-00NoWkR1cSsNz1xP97G01u6mRwtmLK/yKibfuhfto+A=";

  nativeBuildInputs = [
    pkg-config
    python3
  ];

  buildInputs = [
    zstd
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Romanization-aware string comparison for Japanese and Mandarin Chinese";
    homepage = "https://github.com/tagucci/moine";
    changelog = "https://github.com/tagucci/moine/releases/tag/${finalAttrs.src.tag}";
    license = with lib.licenses; [
      asl20
      mit
    ];
    mainProgram = "moine";
  };
})
