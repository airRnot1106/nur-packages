pkgs:
pkgs.lib.makeScope pkgs.newScope (self: {
  bkm = self.callPackage ./bkm { };
  blake = self.callPackage ./blake { };
  dockerfile-roast = self.callPackage ./dockerfile-roast { };
  ghasec = self.callPackage ./ghasec { };
  ghqr = self.callPackage ./ghqr { };
  git-ombl = self.callPackage ./git-ombl { };
  home-manager-prune = self.callPackage ./home-manager-prune { };
  moine = self.callPackage ./moine { };
  nothing-less = self.callPackage ./nothing-less { };
  pim = self.callPackage ./pim { };
  pumlv = self.callPackage ./pumlv { };
  textlint-filter-rule-comments = self.callPackage ./textlint-filter-rule-comments { };
  textlint-rule-preset-ai-writing = self.callPackage ./textlint-rule-preset-ai-writing { };
  textlint-rule-preset-japanese = self.callPackage ./textlint-rule-preset-japanese { };
  uncomment = self.callPackage ./uncomment { };
  version-lsp = self.callPackage ./version-lsp { };
  vikokoro = self.callPackage ./vikokoro { };
  volt = self.callPackage ./volt { };
  yaskkserv2 = self.callPackage ./yaskkserv2 { };
  zerocast = self.callPackage ./zerocast { };
})
