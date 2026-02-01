{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    libwacom-surface
    linux-firmware
    mkcert
    snapshot
  ];
}
