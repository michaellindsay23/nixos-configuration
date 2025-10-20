{ home, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = false; #keep vim available
    package = inputs.nixCats-nvim;
  };
}
