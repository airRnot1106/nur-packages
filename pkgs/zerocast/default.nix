{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  ...
}:
stdenv.mkDerivation {
  pname = "zerocast";
  version = "0-unstable-2026-02-23";

  src = fetchFromGitHub {
    owner = "t3tra-dev";
    repo = "zerocast";
    rev = "53004f10f48244ebb17d2a30bd277ec7d3d4e546";
    sha256 = "sha256-0SZdEra0R1UUlN7FaUPB2RyladDBUaJkxfo8rwVlG+4=";
  };

  nativeBuildInputs = [ cmake ];

  meta = {
    description = "Lossy compression technology boasting the highest compression ratio in history";
    homepage = "https://github.com/t3tra-dev/zerocast";
    license = lib.licenses.mit;
    mainProgram = "zerocast";
  };
}
