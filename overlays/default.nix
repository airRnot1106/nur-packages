{
  # Default overlay that adds all packages to nixpkgs
  default = final: prev: {
    git-ombl = prev.callPackage ../pkgs/git-ombl { };
    home-manager-prune = prev.callPackage ../pkgs/home-manager-prune { };
    pim = prev.callPackage ../pkgs/pim { };
    version-lsp = prev.callPackage ../pkgs/version-lsp { };
    volt = prev.callPackage ../pkgs/volt { };
    yaskkserv2 = prev.callPackage ../pkgs/yaskkserv2 { };
  };
}
