{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    moonlight-qt
    obsidian
    spotify
    vscodium-fhs
  ];
}
