{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule (finalAttrs: {
  pname = "volt";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "owenHochwald";
    repo = "volt";
    tag = "v${finalAttrs.version}";
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
    homepage = "https://github.com/owenHochwald/Volt";
    license = lib.licenses.mpl20;
    mainProgram = "volt";
  };
})
