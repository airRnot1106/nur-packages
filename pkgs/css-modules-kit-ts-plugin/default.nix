{
  lib,
  buildNpmPackage,
  fetchzip,
  nodejs,
  typescript,
}:

buildNpmPackage (finalAttrs: {
  pname = "css-modules-kit-ts-plugin";
  version = "1.4.0";

  src = fetchzip {
    url = "https://registry.npmjs.org/@css-modules-kit/ts-plugin/-/ts-plugin-${finalAttrs.version}.tgz";
    hash = "sha256-RFybfePA08G7L0TMBrNEThhLrbbU/B64X2Zj3gWKatk=";
  };

  npmDepsHash = "sha256-PgyszujfzaoH1/7gSwP8PNfvaAoHdDy+Cg+BpZ3oABs=";

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  npmFlags = [ "--legacy-peer-deps" ];
  npmPackFlags = [ "--ignore-scripts" ];
  dontNpmBuild = true;

  postInstall = ''
    ln -s ${typescript}/lib/node_modules/typescript \
      "$out/lib/node_modules/@css-modules-kit/ts-plugin/node_modules/typescript"
  '';

  meta = {
    description = "TypeScript Language Service Plugin for CSS Modules";
    homepage = "https://github.com/mizdra/css-modules-kit/tree/main/packages/ts-plugin";
    license = lib.licenses.mit;
    platforms = nodejs.meta.platforms;
  };
})
