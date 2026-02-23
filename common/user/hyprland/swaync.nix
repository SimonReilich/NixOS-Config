{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;
    settings = {
      ignoreGtkTheme = true;
      positionX = "left";
      positionY = "top";

      control-center-width = 360;
      control-center-margin-top = 16;
      control-center-margin-bottom = 16;
      control-center-margin-left = 16;
      notification-window-width = 360;
      layer = "top";

      timeout = 10;
      timeout-low = 5;
      timeout-critical = 20;

      hide-on-clear = true;
      hide-on-action = true;

      widgets = [
        "mpris"
        "notifications"
        "title"
      ];
    };

    style = ''

    '';
  };
}
