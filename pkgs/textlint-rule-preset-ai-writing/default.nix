{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  textlint,
}:

buildNpmPackage (finalAttrs: {
  pname = "textlint-rule-preset-ai-writing";
  version = "1.6.1";

  src = fetchFromGitHub {
    owner = "textlint-ja";
    repo = "textlint-rule-preset-ai-writing";
    rev = "v${finalAttrs.version}";
    hash = "sha256-MI1jm/3KSOYxbZ5+FUL+MSBqojNnUDJENyzkZ10aD6o=";
  };

  npmDepsHash = "sha256-l7d9gd2wF1MF5WbKEbpL3D/1WIpF9WXVFnWaQ/aXmGE=";

  npmPackFlags = [ "--ignore-scripts" ];

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  meta = {
    description = "Textlintプリセット：AIっぽい記述パターンを検出し、より自然な日本語表現を促すルール集";
    homepage = "https://github.com/textlint-ja/textlint-rule-preset-ai-writing";
    license = lib.licenses.mit;
    platforms = textlint.meta.platforms;
  };
})
