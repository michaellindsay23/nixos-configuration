{ inputs, pkgs, config, lib, ... }:
{
  home.packages = with pkgs; [
    yazi
    kitty-themes
  ];

  programs.kitty = {
    enable = true;

    settings = {
      dynamic_background_opacity = true;
      background_opacity = 0.8;
    };
  };

  home.file.".bashrc".text = ''
    #caelestia scheme set -n dynamic
    alias nrebuild="sh ~/nixos-configuration/rebuild.sh"

    # Open zellij on start
    if [[ -z "$ZELLIJ" ]]; then
      zellij && exit
    fi
  '';
}
