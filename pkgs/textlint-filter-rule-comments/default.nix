{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  textlint,
}:

buildNpmPackage (finalAttrs: {
  pname = "textlint-filter-rule-comments";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "textlint";
    repo = "textlint-filter-rule-comments";
    tag = "v${finalAttrs.version}";
    hash = "sha256-iTC2BeOctlzJcX8Cp1wFwNtrW5n2bglmVU5bwDjr6E4=";
  };

  npmDepsHash = "sha256-eTHVWRBgEi/9/cDSDZ4g00E/9ZZqgb0OliXtxdmCCNk=";

  npmPackFlags = [ "--ignore-scripts" ];

  meta = {
    description = "Textlint filter rule that disables all rules between comments directive";
    homepage = "https://github.com/textlint/textlint-filter-rule-comments";
    license = lib.licenses.mit;
    platforms = textlint.meta.platforms;
  };
})
