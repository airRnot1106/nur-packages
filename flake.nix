{
  description = "airRnot's NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      legacyPackages = forAllSystems (
        system:
        import ./default.nix {
          pkgs = import nixpkgs { inherit system; };
        }
      );
      packages = forAllSystems (
        system:
        nixpkgs.lib.filterAttrs (
          _: v:
          let
            probe = builtins.tryEval (nixpkgs.lib.isDerivation v);
          in
          probe.success && probe.value
        ) self.legacyPackages.${system}
      );
      overlays = import ./overlays;
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
