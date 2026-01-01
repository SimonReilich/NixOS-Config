{ config, pkgs, ... }:

{
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.peripherals.touchpad]
    click-method='default'
  '';

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  environment.systemPackages = with pkgs.gnomeExtensions; [
    touchup
  ];
}
