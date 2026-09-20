pkgs:
pkgs.lib.makeScope pkgs.newScope (self: {
  bkm = self.callPackage ./bkm { };
  css-modules-kit-ts-plugin = self.callPackage ./css-modules-kit-ts-plugin { };
  dockerfile-roast = self.callPackage ./dockerfile-roast { };
  ghasec = self.callPackage ./ghasec { };
  home-manager-prune = self.callPackage ./home-manager-prune { };
  jev-lint = self.callPackage ./jev-lint { };
  moine = self.callPackage ./moine { };
  pumlv = self.callPackage ./pumlv { };
  stylelint-language-server = self.callPackage ./stylelint-language-server { };
  suiko = self.callPackage ./suiko { };
  textlint-filter-rule-comments = self.callPackage ./textlint-filter-rule-comments { };
  textlint-rule-preset-ai-writing = self.callPackage ./textlint-rule-preset-ai-writing { };
  textlint-rule-preset-japanese = self.callPackage ./textlint-rule-preset-japanese { };
  uncomment = self.callPackage ./uncomment { };
  vikokoro = self.callPackage ./vikokoro { };
  yaskkserv2 = self.callPackage ./yaskkserv2 { };
})
