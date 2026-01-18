# Miscellaneous packages not requiring configuration
{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    #obsidian
    #vscodium-fhs
    moonlight-qt
  ];
}
