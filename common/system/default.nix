{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./fonts
    ./boot.nix
    ./exclude.nix
    ./flatpak.nix
    ./git.nix
    ./local.nix
    ./networking.nix
    ./printing.nix
    ./sound.nix
    ./packages.nix
    ./system.nix
    ./zsh.nix
  ];
}
