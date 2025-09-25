{ pkgs, config, username, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --asterisks --seesions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session}";
        user = username;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
}
