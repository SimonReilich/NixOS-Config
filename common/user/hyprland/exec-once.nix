{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "waybar &"
      # No need for locking right after greetd
      # "hyprlock"
    ];
  };
}
