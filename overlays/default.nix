{
  # Default overlay that adds all packages to nixpkgs
  default = final: prev: import ../pkgs prev;
}
