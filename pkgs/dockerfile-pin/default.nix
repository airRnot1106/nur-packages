{
  lib,
  buildGoModule,
  fetchFromGitHub,
  gitMinimal,
  makeWrapper,
  docker-credential-helpers,
}:

buildGoModule (finalAttrs: {
  pname = "dockerfile-pin";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "azu";
    repo = "dockerfile-pin";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vBBcLQ4ZgiLbUMuDvn8Um24yB9EknuUeU+sxMdg+qoc=";
  };

  vendorHash = "sha256-CgMFIYoM+nWiZ5NXtTlXHhrjzVYxoVg0YVpQq3LLrjI=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/azu/dockerfile-pin/cmd.version=${finalAttrs.version}"
  ];

  nativeBuildInputs = [ makeWrapper ];

  postFixup = ''
    wrapProgram $out/bin/dockerfile-pin \
      --prefix PATH : ${lib.makeBinPath [ docker-credential-helpers ]}
  '';

  nativeCheckInputs = [ gitMinimal ];

  meta = {
    description = "Add sha256 digests to Docker images in Dockerfiles, Compose, and GitHub Actions";
    homepage = "https://github.com/azu/dockerfile-pin";
    changelog = "https://github.com/azu/dockerfile-pin/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "dockerfile-pin";
  };
})
