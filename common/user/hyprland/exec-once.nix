{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      # No need for locking right after greetd
      # "hyprlock"
    ];
  };
}
