{
  lib,
  stdenv,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "ghasec";
  version = "0.13.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "koki-develop";
    repo = "ghasec";
    tag = "v${finalAttrs.version}";
    hash = "sha256-3yUpASuGzHns1TsYZ+m2v3iF8ookKJcqF1uVgt0Ebts=";
    fetchSubmodules = true;
  };

  vendorHash = "sha256-yL/lOQ7VdDLIsR5DpC21SHBmVnilLKVkQkc3NWlP4jM=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/koki-develop/ghasec/cmd.version=${finalAttrs.version}"
  ];

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    installShellCompletion --cmd 'ghasec' \
      --bash <("$out/bin/ghasec" completion bash) \
      --zsh <("$out/bin/ghasec" completion zsh) \
      --fish <("$out/bin/ghasec" completion fish)
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Security-focused linter for Github Actions workflows";
    homepage = "https://github.com/koki-develop/ghasec";
    changelog = "https://github.com/koki-develop/ghasec/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "ghasec";
  };
})
