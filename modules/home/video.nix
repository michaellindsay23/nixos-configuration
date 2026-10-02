{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wf-recorder
    openshot-qt
    slurp
  ];
}
