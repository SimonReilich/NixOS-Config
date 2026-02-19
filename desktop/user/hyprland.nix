{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "HDMI-A-1, 3440x1440@99.99Hz, auto, auto"
    ];
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "HDMI-A-1";
          path = "/home/simonr/.dotfiles/desktop/wallpaper.png";
          fit_mode = "cover";
        }
      ];
    };
  };
}
