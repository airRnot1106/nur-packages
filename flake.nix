{
  description = "airRnot's NUR repository";
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.git-hooks.flakeModule
        inputs.treefmt-nix.flakeModule
      ];

      systems = import inputs.systems;

      perSystem =
        {
          config,
          pkgs,
          system,
          ...
        }:
        {
          legacyPackages = import ./default.nix { inherit pkgs; };
          packages = pkgs.lib.filterAttrs (_: v: pkgs.lib.isDerivation v) config.legacyPackages;

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              git
              nil
            ];
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };

          pre-commit = import ./pre-commit.nix { inherit config; };
          treefmt = import ./treefmt.nix;
        };
    };
}
