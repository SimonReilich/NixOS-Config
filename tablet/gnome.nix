{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.peripherals.touchpad]
    click-method='default'
  '';

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
