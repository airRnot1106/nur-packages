{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "paracell";
  version = "0.1-unstable-2026-05-24";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "hgsg11";
    repo = "paracell";
    rev = "d89791362ab3720cb4959025f70a69d7b45a9dcb";
    hash = "sha256-xZFEehmC2KgbFh2B0Sc0pSUCByC4jrYB6a+Og134eIg=";
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
