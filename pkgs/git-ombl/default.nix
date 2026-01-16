{
  lib,
  rustPlatform,
  fetchFromGitHub,
  libiconv,
  openssl,
  pkg-config,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "git-ombl";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "airRnot1106";
    repo = "git-ombl";
    tag = "v${finalAttrs.version}";
    hash = "sha256-pqCmb31Rh37cWpKK4fvpyfjWkc2qPmKXkBM1c2CCkr8=";
  };

  cargoHash = "sha256-u0pF7FB/MkKp+iiCrcScFbePpytu4SMD+txTOxN/CQE=";

  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    libiconv
    openssl
  ];

  doCheck = false;

  meta = {
    description = "Git blame wrapper to display the full commit history for a line";
    homepage = "https://github.com/airRnot1106/git-ombl";
    license = lib.licenses.mit;
    mainProgram = "git-ombl";
  };
})
