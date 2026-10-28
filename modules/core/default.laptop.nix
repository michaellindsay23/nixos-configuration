{ inputs, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  imports = [
    ./nvidia.nix
    ./default.nix
  ];
}
