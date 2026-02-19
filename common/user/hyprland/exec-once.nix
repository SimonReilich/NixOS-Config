{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    exec_once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprlock.service"
    ];
    exec_always = [
      "systemctl --user start waybar.service"
    ];
  };
}
