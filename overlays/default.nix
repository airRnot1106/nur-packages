{
  # Default overlay that adds all packages to nixpkgs
  default = final: prev: {
    git-ombl = final.callPackage ../pkgs/git-ombl { };
    pim = final.callPackage ../pkgs/pim { };
    version-lsp = final.callPackage ../pkgs/version-lsp { };
    volt = final.callPackage ../pkgs/volt { };
  };
}
