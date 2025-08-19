{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    app-hider
    appindicator
    blur-my-shell
    forge
    gsconnect
    rounded-window-corners-reborn

    gnome-control-center
    gnome-tweaks

    adw-gtk3
  ];
}
