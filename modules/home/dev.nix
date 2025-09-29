{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Lsp
    nixd

    #formatting
    

    devenv
  ];
}
