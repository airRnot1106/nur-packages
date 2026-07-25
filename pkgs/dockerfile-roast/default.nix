{
  lib,
  rustPlatform,
  fetchFromGitHub,
  gitMinimal,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "dockerfile-roast";
  version = "1.4.8";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "immanuwell";
    repo = "dockerfile-roast";
    tag = finalAttrs.version;
    hash = "sha256-L17QnVlYVy0uT8vtm+zLTjNXyri1xVn/Ld4n3bXHyEo=";
  };

  cargoHash = "sha256-7ec2omH69SQUIWpLCaMKhTYub7yOY5ISYfMi5taPoeU=";

  nativeCheckInputs = [ gitMinimal ];
  preCheck = ''
    export HOME=$TMPDIR
    git init
  '';

  meta = {
    description = "Dockerfile linter that actually has opinions";
    homepage = "https://github.com/immanuwell/dockerfile-roast";
    license = lib.licenses.mit;
    mainProgram = "droast";
  };
})
