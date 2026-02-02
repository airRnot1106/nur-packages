{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "blake";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "airRnot1106";
    repo = "blake";
    tag = "v${finalAttrs.version}";
    hash = "sha256-BFSD4h8g5EuSijzmfpvHqIDc+t2K8SZjf6KHUW2EOVg=";
  };

  cargoHash = "sha256-4jO7/J3DvsgrQnSQVlBby5ib7GdvJvtgA296cQ1MwhE=";

  buildInputs = [ openssl ];
  nativeBuildInputs = [ pkg-config ];

  meta = {
    description = "Tig-like terminal UI for exploring git blame history";
    homepage = "https://github.com/airRnot1106/blake";
    license = lib.licenses.mit;
    mainProgram = "blake";
  };
})
