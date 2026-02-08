{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  cargo-tauri,
  fetchNpmDeps,
  glib,
  gtk3,
  nodejs,
  npmHooks,
  openssl,
  pkg-config,
  webkitgtk_4_1,
  wrapGAppsHook4,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "vikokoro";
  version = "0-unstable-2026-02-06";

  src = fetchFromGitHub {
    owner = "KASAHARA-Kyohei";
    repo = "vikokoro";
    rev = "e9a37a149db0993d498c7a96f924763fe1027acd";
    sha256 = "sha256-bhr7pIwmALw7ePihQqY9M9tcRJk8lh1mmw1fXLb3OB8=";
  };

  npmDeps = fetchNpmDeps {
    name = "${finalAttrs.pname}-${finalAttrs.version}-npm-deps";
    inherit (finalAttrs) src;
    hash = "sha256-CiiraV23cfvpfW7CSPiByH5o232wKvDkQvmqotbKs90=";
  };

  cargoRoot = "src-tauri";
  buildAndTestSubdir = finalAttrs.cargoRoot;

  cargoHash = "sha256-iAezX95PsRCwZi2J8q0m414NKBDVUOw6zUjLPGNKp3Q=";

  nativeBuildInputs = [
    cargo-tauri.hook
    nodejs
    npmHooks.npmConfigHook
    pkg-config
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [ wrapGAppsHook4 ];

  buildInputs = [
    openssl
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    glib
    gtk3
    webkitgtk_4_1
  ];

  postInstall = lib.optionalString stdenv.hostPlatform.isDarwin ''
    mkdir -p "$out/bin"
    ln -sf "$out/Applications/vikokoro.app/Contents/MacOS/vikokoro" "$out/bin/vikokoro"
  '';

  meta = {
    description = "Keyboard-centric tree/mind map editor";
    homepage = "https://github.com/KASAHARA-Kyohei/vikokoro";
    license = lib.licenses.mit;
    mainProgram = "vikokoro";
  };
})
