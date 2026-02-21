{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1, 2880x1920@120Hz, auto, auto"
      ];

      plugin = {
        touch_gestures = {
          sensitivity = 4.0;

          long_press_delay = 400;
          resize_on_border_long_press = true;
          edge_margin = 10;
          emulate_touchpad_swipe = false;

          hyprgrass-bind = [
            ", edge:r:l, workspace, +1"
            ", edge:l:r, workspace, -1"
            ", edge:d:u, killactive"
            ", longpress:4, togglefloating"
          ];

          hyprgrass-bindm = [
            ", longpress:2, movewindow"
            ", longpress:3, resizewindow"
          ];

          hyprgrass-gesture = [

          ];
        };
      };
    };

    plugins = [
      inputs.hyprgrass.packages.${pkgs.system}.default
      inputs.hyprgrass.packages.${pkgs.system}.hyprgrass-pulse
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
