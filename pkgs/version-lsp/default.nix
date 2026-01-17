{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  cacert,
  makeBinaryWrapper,
}:

rustPlatform.buildRustPackage {
  pname = "version-lsp";
  version = "unstable-2026-01-16";

  src = fetchFromGitHub {
    owner = "skanehira";
    repo = "version-lsp";
    rev = "ede6ac749e06731b5fbed84d3382766e6a1ae321";
    hash = "sha256-E+Nyr9fDOOElPNSYSYj0XTaVWbF4ZuNTCouz/qgE4zg=";
  };

  cargoHash = "sha256-Tt0LaYDr8hq+DENfLA1ayM80sNNu0QA/il4gsnreNlY=";

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
    description = "A Language Server Protocol (LSP) implementation that provides version checking diagnostics for package dependency files";
    homepage = "https://github.com/skanehira/version-lsp";
    license = lib.licenses.mit;
    mainProgram = "version-lsp";
  };
}
