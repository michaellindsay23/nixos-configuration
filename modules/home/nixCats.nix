{ home, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = false; #keep vim available
  };
}
