{ inputs, pkgs, ...}:
{
  imports = [ inputs.caelestia-shell.packages.x86_64-linux.with-cli ];  

  programs.caelestia = {
    enable = true;

    systemd = {
      target = "graphical-session.target";
      environment = [];
    };

    settings = {
      bar.status = {
        showBattery = true;
      };

      paths.wallpaperDir = "~/Images";
    };

    cli = {
      enable = true; # Also add caelestia-cli to path

      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
