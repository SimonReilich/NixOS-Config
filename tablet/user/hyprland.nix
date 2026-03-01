{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, 2880x1920@120Hz, auto, auto"
    ];
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "eDP-1";
          path = "/home/simonr/.dotfiles/tablet/wallpaper.png";
          fit_mode = "cover";
        }
      ];
    };
  };
}
