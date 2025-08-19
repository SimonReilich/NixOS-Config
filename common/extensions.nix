{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    app-hider
    appindicator
    blur-my-shell
    forge
    gsconnect
    rounded-window-corners-reborn
  ];
}
