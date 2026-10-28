{ inputs, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [
    ./amd.nix
    ./default.nix
  ];
}
