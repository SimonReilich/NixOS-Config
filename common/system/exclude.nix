{ config, pkgs, ... }:

{
  # Disable preinstalled software
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    simple-scan
    seahorse
    snapshot

    gnome-music
    gnome-maps
    gnome-tour
    gnome-weather
  ];
}
