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

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    lshw
  ];

  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;
}
