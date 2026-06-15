{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "paracell";
  version = "0.1.11";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "hgsg11";
    repo = "paracell";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Yym3276w8xk4SLINkqjx1vba7icttxe8W6W2mF88KSA=";
  };

  vendorHash = "sha256-tSLf4m2JlOUq2QqPMYiAzSbTvOzmwfGtjEL69p+j9c8=";

  ldflags = [
    "-s"
    "-w"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "CLI for creating isolated per-issue development cells from a project repo";
    homepage = "https://github.com/hgsg11/paracell";
    license = lib.licenses.mit;
    mainProgram = "paracell";
  };
})
