{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors and Viewers
    apostrophe
    obsidian
    onlyoffice-desktopeditors
    switcheroo
    video-trimmer

    # Info & Entertainment
    chromium
    spotify
    wike
    zotero

    # Communication
    discord
    signal-desktop
    zulip

    # Creative
    figma-linux
    musescore
    blender

    # Development
    jetbrains.webstorm
    jetbrains.rust-rover
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.clion
    nixfmt
    nixfmt-tree
    tex-fmt
    typstyle
    godot

    # Gaming
    cartridges
    modrinth-app

    # Utility
    binary
    eyedropper
    gnome-decoder
    gnome-graphs
    gnome-solanum
    hieroglyphic
    zoxide

    # Customization
    adw-gtk3
    gnome-control-center
    gnome-tweaks
  ];
}
