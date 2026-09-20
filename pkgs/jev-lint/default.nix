{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  nix-update-script,
}:

buildNpmPackage (finalAttrs: {
  pname = "jev-lint";
  version = "0.2.0";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "mizchi";
    repo = "jev-lint";
    tag = "v${finalAttrs.version}";
    hash = "sha256-9uzM5vGKbUsWCkFm3AMuGE1im3JTxxPL6pmxH2Np+4M=";
  };

  npmDepsHash = "sha256-xfhkwFzbKnqb0FRJ+zu1sYoor/kvrHfYxSOr0vLAopg=";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Linter for the things a linter could never check";
    homepage = "https://github.com/mizchi/jev-lint";
    license = lib.licenses.mit;
    mainProgram = "jev-lint";
  };
})
