{
  lib,
  buildNpmPackage,
  fetchzip,
  nodejs,
}:

buildNpmPackage (finalAttrs: {
  pname = "stylelint-language-server";
  version = "1.1.1";

  src = fetchzip {
    url = "https://registry.npmjs.org/@stylelint/language-server/-/language-server-${finalAttrs.version}.tgz";
    hash = "sha256-oKOdJvhvPwik43gx5JrfRn/YHflJu3g2xUE9fdYE5TY=";
  };

  npmDepsHash = "sha256-GNd5sTfUTgSWdCoSikk927IzrwX1QLHuCkPpR687tFQ=";

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  npmFlags = [ "--legacy-peer-deps" ];
  npmPackFlags = [ "--ignore-scripts" ];
  dontNpmBuild = true;

  meta = {
    description = "Stylelint Language Server Protocol implementation";
    homepage = "https://github.com/stylelint/vscode-stylelint/tree/main/packages/language-server";
    license = lib.licenses.mit;
    mainProgram = "stylelint-language-server";
    platforms = nodejs.meta.platforms;
  };
})
