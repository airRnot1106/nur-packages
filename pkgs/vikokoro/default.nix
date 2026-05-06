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
  version = "0-unstable-2026-05-03";

  src = fetchFromGitHub {
    owner = "KASAHARA-Kyohei";
    repo = "vikokoro";
    rev = "1855d701d76dc7886844c66162fe0bd8c07b6fe1";
    sha256 = "sha256-uOmGC1lr3e/zmkSXt1ij44r5kFiJo5aOU5kqQ5dXdwM=";
  };

  npmDeps = fetchNpmDeps {
    name = "${finalAttrs.pname}-${finalAttrs.version}-npm-deps";
    inherit (finalAttrs) src;
    hash = "sha256-okxisYJljLjVH+DxUgejLI9WMlMcPl6pV8X1mCB/v40=";
  };

  cargoRoot = "src-tauri";
  buildAndTestSubdir = finalAttrs.cargoRoot;

  cargoHash = "sha256-LWchbdBHxBXdTHyZp/Q2wtTFBmDXlvN0LJqFaxpxSXc=";

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
