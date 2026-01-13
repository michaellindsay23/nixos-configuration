{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    deadlock-mod-manager
  ];
}
