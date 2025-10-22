{ inputs, pkgs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = { 
        # keep vim available
        vimAlias = false;

        theme = {
          enable = true;
          name = "dracula";
          style = "dark";
          transparent = true;
        };

        telescope.enable = true;
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;
        
        lsp = {
          enable = true;
        
          servers = {
            nixd.enable = true;
          };
        };

        treesitter.enable = true;

        languages = {
          nix.enable = true;
          rust.enable = true;
          java.enable = true;
        };

        extraPlugins = {
          themery = {
            package = pkgs.vimPlugins.themery-nvim;
            setup = ''
              require('themery').setup {
                themes = {"gruvbox-dark", "shado"},
                livePreview = true,
              }
            '';
          };
        };
      };
    };
  };
}
