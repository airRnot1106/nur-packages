{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "paracell";
  version = "0.1.13";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "hgsg11";
    repo = "paracell";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Weh1agH2KYK0E7Pw188+E4UJ5yW7ByRiydqpH+AxOAg=";
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
