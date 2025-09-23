{ config, pkgs, system, inputs, ... }:
{
  home.username = "michael-lindsay";
  home.homeDirectory = "/home/michael-lindsay";

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
  ];

  imports = [
    ./zen-browser.nix
  ];

  home.stateVersion = "25.05";
}
