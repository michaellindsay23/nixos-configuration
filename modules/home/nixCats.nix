{ home, ... }:
{
  home.packages = [
    inputs.nixCats-nvim.packages.${pkgs.system}.default
  ];

  programs.neovim = {
    enable = true;
    vimAlias = false; #keep vim available

  }
}
