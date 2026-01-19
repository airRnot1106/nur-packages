{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule (finalAttrs: {
  pname = "bkm";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "airRnot1106";
    repo = "bkm";
    rev = "v${finalAttrs.version}";
    hash = "sha256-kxBmaPufLg0i0DtaUTcWLzVudRaYV7JGjNXaTuNPjpM=";
  };

  vendorHash = "sha256-QRixhOMcYd0FENifqzSyakM/9UgXOAaZtwKoaJUEshI=";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/airRnot1106/bkm/cmd.version=${finalAttrs.version}"
  ];

  doCheck = false;

  meta = {
    description = "Bookmark manager integrated with Fuzzy Finder";
    homepage = "https://github.com/airRnot1106/bkm";
    license = lib.licenses.mit;
    mainProgram = "bkm";
  };
})
