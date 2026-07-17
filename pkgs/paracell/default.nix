{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "paracell";
  version = "0.1.18";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "hgsg11";
    repo = "paracell";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jqIFGUsKAZzDDwn1liCZnzyTfPlVs0kZS8VcM6BMPSU=";
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
