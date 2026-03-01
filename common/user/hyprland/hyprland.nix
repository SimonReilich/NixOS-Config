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
    jq
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
}
