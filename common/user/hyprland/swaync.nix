{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "left";
      positionY = "top";
      control-center-width = 380;
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      notification-window-width = 350;
      layer = "top";
      cssPriority = "application";
    };

    style = ''
      .control-center {
        background: rgba(20, 23, 20, 0.75); /* Dark olive/charcoal tint */
        border-radius: 30px; /* High rounding like the image */
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.8);
        padding: 20px;
      }

      .notification {
        background: rgba(35, 38, 35, 0.6);
        border-radius: 20px;
        margin: 10px 0px;
        padding: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
      }

      .notification-content {
        margin: 5px;
      }

      .notification-default {
        background: rgba(45, 50, 45, 0.8);
        border-radius: 18px;
      }

      .notification-action {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 12px;
        color: white;
        margin: 4px;
      }

      .notification-action:hover {
        background: rgba(255, 255, 255, 0.1);
      }
    '';
  };
}
