{ config, pkgs, ... }:

{
  users.users.simonr.packages = with pkgs; [
    # Editors and Viewers
    apostrophe
    obsidian
    onlyoffice-desktopeditors
    switcheroo
    texstudio
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

    # Customization
    addwater
  ];

  # Install firefox.
  programs.firefox.enable = true;
}
