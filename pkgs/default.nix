pkgs:
pkgs.lib.makeScope pkgs.newScope (self: {
  bkm = self.callPackage ./bkm { };
  blake = self.callPackage ./blake { };
  cell = self.callPackage ./cell { };
  dockerfile-pin = self.callPackage ./dockerfile-pin { };
  ghqr = self.callPackage ./ghqr { };
  git-ombl = self.callPackage ./git-ombl { };
  home-manager-prune = self.callPackage ./home-manager-prune { };
  opensrc = self.callPackage ./opensrc { };
  pim = self.callPackage ./pim { };
  similarity = self.callPackage ./similarity { };
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
