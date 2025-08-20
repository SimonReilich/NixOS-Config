{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    pipewire-settings
  ];
}