{ inputs, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_7_1;

  imports = [
    ./nvidia.nix
    ./default.nix
  ];
}
