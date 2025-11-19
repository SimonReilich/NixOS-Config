{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  fonts.fontDir.enable = true;

  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    clipboard-history
    gsconnect
    hide-top-bar
    quick-settings-audio-panel
    rounded-window-corners-reborn
  ];
}
