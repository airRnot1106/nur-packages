pkgs: {
  git-ombl = pkgs.callPackage ./git-ombl { };
  home-manager-prune = pkgs.callPackage ./home-manager-prune { };
  pim = pkgs.callPackage ./pim { };
  uncomment = pkgs.callPackage ./uncomment { };
  version-lsp = pkgs.callPackage ./version-lsp { };
  volt = pkgs.callPackage ./volt { };
  yaskkserv2 = pkgs.callPackage ./yaskkserv2 { };
}
