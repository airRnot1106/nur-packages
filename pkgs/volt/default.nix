{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "volt";
  version = "unstable-2026-01-13";

  src = fetchFromGitHub {
    owner = "owenHochwald";
    repo = "volt";
    rev = "2cf241a5bf87e33bbadcea1426c3d2787ca974cb";
    hash = "sha256-P18Zbuw4AgsGsTfK2mPAL5jyQgMuiFQ6g3OabhaypP4=";
  };

  vendorHash = "sha256-NEWoBsPbLzrd/oIn/1CX7JmDB5pPpSPRi1Df0OUqEMI=";

  doCheck = false;

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "High-performance, concurrent, terminal-based HTTP client";
    homepage = "https://github.com/owenHochwald/volt";
    license = lib.licenses.mpl20;
    mainProgram = "volt";
  };
}
