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

      download-buffer-size = 524288000; #500 MiB
    };
  };

  #currently split into default.desktop.nix and default.laptop.nix due to nvidia driver conflicts with the latest driver version
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };

  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
  '';

  # terminal packages I find useful
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    lshw
    upower
    unzip
    zip
    unrar
  ];

  programs = {
    ssh.startAgent = true;
  };

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    tailscale.enable = true;
    blueman.enable = true;
    sunshine.enable = true;
    hardware.openrgb.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    firmware = [ pkgs.linux-firmware ];
  };

  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;
}
