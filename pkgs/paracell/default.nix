{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "paracell";
  version = "0.1.5";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "hgsg11";
    repo = "paracell";
    tag = "v${finalAttrs.version}";
    hash = "sha256-69MIoEJX1Hx9im1jFfeVAMauGyrwcOIugHvRHCt3qPM=";
  };

  vendorHash = "sha256-AWHZO+p6kaHV4b+bpz62Xnluynw1EpVFVxhEWEHyLbg=";

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
