
{ inputs, ... }:
{
  imports = [
    ./nvidia.nix
    ../home/gaming
    ./default.nix
  ];
}
