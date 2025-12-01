{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Lsp
    nixd
    #python312Packages.python-lsp-server

    #formatting

    
    #languages
    #python312
    #rust
    #jupyter
    #jdk21
  ];
}
