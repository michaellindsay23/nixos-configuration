{ inputs, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_7_2;

  imports = [
    ./nvidia.nix
    ./default.nix
  ];
}
