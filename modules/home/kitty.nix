{ host, pkgs, ... }:
{
  home.packages = [
    pkgs.yazi
  ];

  programs.kitty = {
    enable = true;
  };
}
