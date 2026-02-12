{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    #vesktop
    discord

    xdg-utils
    xdg-desktop-portal
  ];
}
