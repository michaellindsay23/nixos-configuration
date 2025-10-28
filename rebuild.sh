# Allows for rebuilding nixos from any directory, assuming config is in the user path
# Alias used is "nrebuild <config name>", found in the bash.rc declaration in modules/home/kitty.nix

git -C ~/nixos-configuration/ add ~/nixos-configuration/*
nix flake update nixvim-config --flake ~/nixos-configuration/
sudo nixos-rebuild switch --flake ~/nixos-configuration/#$1
