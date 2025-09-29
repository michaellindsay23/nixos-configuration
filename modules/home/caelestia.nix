{ inputs, pkgs, ...}:
{
  imports = [ inputs.cealestia-shell.homeManagerModules."with-cli";  

  programs.caelestia = {
    enable = true;

    systemd = {
      target = "graphical-session.target";
      environment = [];
    };

    settings = {
      bar.status = {
        showBattery = false;
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
