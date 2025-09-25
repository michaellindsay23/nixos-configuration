{ inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./system.nix
    ./home-manager.nix
    ./wayland.nix
  ];
}
