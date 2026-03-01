{
  inputs,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    wireplumber
    pulsemixer
    hyprpolkitagent
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.x86_64-linux.hyprland;
    portalPackage = inputs.hyprland.packages.x86_64-linux.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  programs.zsh.profileExtra = ''
    if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      exec uwsm start -S hyprland-uwsm.desktop
    fi
  '';
}
