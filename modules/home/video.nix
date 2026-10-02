{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wf-recorder
    shotcut
    slurp
  ];
}
