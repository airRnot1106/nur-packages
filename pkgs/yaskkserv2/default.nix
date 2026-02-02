{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
}:

rustPlatform.buildRustPackage {
  pname = "yaskkserv2";
  version = "0.1.7-unstable-2025-05-16";

  src = fetchFromGitHub {
    owner = "wachikun";
    repo = "yaskkserv2";
    rev = "7341a0fd2e9d05f371de1dd0e797c92662e35443";
    hash = "sha256-d037sMzr/9fa0Osl0ciQJT6FjdGlxqE7F/K+Iu+HJlw=";
  };

  cargoHash = "sha256-pj08zWyaXTeg6hffFzQo0cH8k1/A8npxwdLtgHnxUpE=";

  buildInputs = [ openssl ];
  nativeBuildInputs = [ pkg-config ];

  doCheck = false;

  meta = {
    description = "Yet Another SKK server";
    homepage = "https://github.com/wachikun/yaskkserv2";
    license = lib.licenses.mit;
    mainProgram = "yaskkserv2";
  };
}
