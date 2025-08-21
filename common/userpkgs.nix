{ config, pkgs, ... }:

{
  users.users.simonr.packages = with pkgs; [
    # Editors and Viewers
    apostrophe
    obsidian
    onlyoffice-desktopeditors
    switcheroo
    video-trimmer

    # Info & Entertainment
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
    nixfmt-rfc-style

    # gaming
    cartridges
    modrinth-app

    # Utility
    binary
    eyedropper
    gnome-decoder
    gnome-graphs
    gnome-solanum
    hieroglyphic
    stow

    # Customization
    addwater
    adw-gtk3
    gnome-control-center
    gnome-tweaks
  ];

  # Install firefox.
  programs.firefox.enable = true;
}
