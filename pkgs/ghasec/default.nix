{
  lib,
  stdenv,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  shellcheck,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "ghasec";
  version = "0.15.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "koki-develop";
    repo = "ghasec";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NeRijMEspqRuDMva6xaB46vWndzHqiDnkea66XvbmN8=";
    fetchSubmodules = true;
  };

  vendorHash = "sha256-/r1Nil9sHdKlqH3TL7jCy1wnTfk+D41pwf0MWV81hpE=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/koki-develop/ghasec/cmd.version=${finalAttrs.version}"
  ];

  nativeBuildInputs = [
    installShellFiles
  ];

  nativeCheckInputs = [
    shellcheck
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
