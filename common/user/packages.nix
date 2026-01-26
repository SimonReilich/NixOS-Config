{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors and Viewers
    apostrophe
    onlyoffice-desktopeditors
    switcheroo
    video-trimmer

    # Info & Entertainment
    inputs.helium.defaultPackage.x86_64-linux
    spotify
    wike
    zotero

    # Communication
    discord
    signal-desktop
    zulip

    # Creative
    musescore
    blender
    blockbench
    inputs.affinity-nix.packages.x86_64-linux.v3

    # Development
    nixfmt
    nixfmt-tree
    tex-fmt
    typstyle
    godot
    inputs.popprotosim-neo.packages.x86_64-linux.default
    octave

    # Gaming
    cartridges
    prismlauncher

    # Utility
    binary
    eyedropper
    gnome-decoder
    gnome-graphs
    gnome-solanum
    hieroglyphic
    ffmpeg
    notion-app-enhanced
    gemini-cli

    # Customization
    adw-gtk3
    gnome-control-center
    gnome-tweaks
  ];
}
