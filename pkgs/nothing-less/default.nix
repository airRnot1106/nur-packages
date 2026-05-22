{
  lib,
  python3Packages,
  fetchFromGitHub,
  nix-update-script,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "nothing-less";
  version = "1.17.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "mpryor";
    repo = "nothing-less";
    tag = finalAttrs.version;
    hash = "sha256-6J75PFZbMRWc3f3hRhIhyFCwSAJDrmVVXEEyPnweWJY=";
  };

  build-system = [
    python3Packages.poetry-core
  ];

  dependencies = with python3Packages; [
    packaging
    pyperclip
    textual
  ];

  pythonRelaxDeps = [ "packaging" ];

  pythonImportsCheck = [
    "nless"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "TUI pager with advanced support for tabular data, inferring/swapping delimiters, and real-time event parsing";
    homepage = "https://github.com/mpryor/nothing-less";
    changelog = "https://github.com/mpryor/nothing-less/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "nothing-less";
  };
})
