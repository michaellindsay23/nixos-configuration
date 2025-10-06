{ inputs, programs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;

    settings = {
      # keep vim available
      vim.vimAlias = false;

      vim.lsp = {
        enable = true;

      };

      vim.treesitter = {
        enable = true;
      };
    };
  };
}
