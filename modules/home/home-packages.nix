# Miscellaneous packages not requiring configuration
{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    #obsidian
    spotify
    #vscodium-fhs
    moonlight-qt
  ];
}
