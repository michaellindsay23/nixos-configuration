{ pkgs, inputs, username, ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "${username}"
      ];
    };
  };

  networking.networkmanager = {
    enable = true;
  };

  # terminal packages I find usefull
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    lshw
    upower
    unzip
    zip
    nushell
  ];

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    tailscale.enable = true;
    blueman.enable = true;
  };

  hardware.bluetooth.enable = true;

  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;
}
