{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors and Viewers
    apostrophe
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
    penpot-desktop
    musescore
    blender-hip
    blockbench
    inputs.affinity-nix.packages.x86_64-linux.v3

    # Development
    nixfmt
    nixfmt-tree
    tex-fmt
    typstyle
    godot
    inputs.popprotosim-neo.packages.x86_64-linux.default

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

    # Customization
    adw-gtk3
    gnome-control-center
    gnome-tweaks
  ];
}
