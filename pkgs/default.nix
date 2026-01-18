pkgs:
pkgs.lib.makeScope pkgs.newScope (self: {
  git-ombl = self.callPackage ./git-ombl { };
  home-manager-prune = self.callPackage ./home-manager-prune { };
  pim = self.callPackage ./pim { };
  similarity = self.callPackage ./similarity { };
  textlint-filter-rule-comments = self.callPackage ./textlint-filter-rule-comments { };
  textlint-rule-preset-ai-writing = self.callPackage ./textlint-rule-preset-ai-writing { };
  textlint-rule-preset-japanese = self.callPackage ./textlint-rule-preset-japanese { };
  uncomment = self.callPackage ./uncomment { };
  version-lsp = self.callPackage ./version-lsp { };
  volt = self.callPackage ./volt { };
  yaskkserv2 = self.callPackage ./yaskkserv2 { };
})
