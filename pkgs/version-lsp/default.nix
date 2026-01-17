{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  cacert,
  makeBinaryWrapper,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "version-lsp";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "skanehira";
    repo = "version-lsp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-L/j0CtowcyhohCp8ia1Jd6apq+0KSfE18+exH/ghLP4=";
  };

  cargoHash = "sha256-/6DKJpuBfvNfGAnfSaZjzZozpXK9m8kqVVcO9ubn91Y=";

  nativeBuildInputs = [
    pkg-config
    makeBinaryWrapper
  ];

  buildInputs = [
    openssl
  ];

  postInstall = ''
    wrapProgram $out/bin/version-lsp \
      --set SSL_CERT_FILE ${cacert}/etc/ssl/certs/ca-bundle.crt
  '';

  doCheck = false;

  meta = {
    description = "Language Server Protocol (LSP) implementation that provides version checking diagnostics for package dependency files";
    homepage = "https://github.com/skanehira/version-lsp";
    license = lib.licenses.mit;
    mainProgram = "version-lsp";
  };
})
