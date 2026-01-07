{ inputs, ... }:
{
  imports = [
    ./system.nix
    ./boot.nix
    ./home-manager.nix
    ./wayland.nix
    ./greetd.nix
  ];
}
