{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Lsp
    nixd
    typst
    tdf
    #python312Packages.python-lsp-server

    #formatting

    
    #languages
    #python312
    #rust
    #jupyter
    #jdk21
  ];
}
