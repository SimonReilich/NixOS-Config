# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./system
    ./style.nix
  ];

  users.users.simonr = {
    isNormalUser = true;
    home = "/home/simonr";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
    ];
    shell = pkgs.zsh;
  };
}
