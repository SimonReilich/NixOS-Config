{ config, pkgs, ... }:

{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";
}
