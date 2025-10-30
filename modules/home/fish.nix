{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fish
  ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      starship init fish | source

      # Nix rebuild alias
      alias nrebuild=". ~/nixos-configuration/rebuild.sh"
    '';
  };
}
