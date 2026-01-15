{ inputs, ... }:
{
  imports = [
    ./default.nix
    ./amd.nix
    ../home/default.desktop.nix
  ];
}
