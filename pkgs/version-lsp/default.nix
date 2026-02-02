{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "version-lsp";
  version = "0.4.0-unstable-2026-02-01";

  src = fetchFromGitHub {
    owner = "skanehira";
    repo = "version-lsp";
    rev = "04fecc58a92a3af9ecf412db96898b0ab3d352e4";
    hash = "sha256-+Al/g+yEQlsE3KaMsouRGPn/si1k+YqwjRIr+2VqIzk=";
  };

  cargoHash = "sha256-/HjTxKo5zM533FFhgTOCnnwvc0qBx0dLNL3l9WFsAjk=";

  buildInputs = [ openssl ];
  nativeBuildInputs = [ pkg-config ];

  doCheck = false;

  meta = {
    description = "A Language Server Protocol (LSP) implementation that provides version checking diagnostics for package dependency files";
    homepage = "https://github.com/skanehira/version-lsp";
    license = lib.licenses.mit;
    mainProgram = "version-lsp";
  };
})
