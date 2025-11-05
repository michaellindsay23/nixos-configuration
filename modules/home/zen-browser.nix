# config for zen browser
{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ 
    inputs.zen-browser.packages."x86_64-linux".default
  ];
}
