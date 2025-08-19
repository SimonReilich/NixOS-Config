{ config, pkgs, ... }:

{

  users.users.simonr.packages = with pkgs; [
      # Editors and Viewers
      apostrophe
      switcheroo
      video-trimmer

      # Info & Entertainment
      addwater
      firefox
      spotify
      wike

      # Communication
      discord
      signal-desktop
      zulip

      # Creative
      musescore

      # Development
      jetbrains.webstorm
      jetbrains.rust-rover
      jetbrains.pycharm-professional
      jetbrains.idea-ultimate
      jetbrains.clion
      vscode

      # Utility
      binary
      emblem
      eyedropper
      gnome-decoder
      gnome-graphs
      hieroglyphic
    ];

  # Install firefox.
  programs.firefox.enable = true;

}
