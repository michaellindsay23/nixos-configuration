{ inputs, ... }:
{
  home.packages = [
    inputs.hyprdynamicmonitors.packages."x86_64-linux".default
  ];
}
