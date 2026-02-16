{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors and Viewers
    apostrophe
    onlyoffice-desktopeditors
    switcheroo
    video-trimmer
    rnote

    # Info & Entertainment
    spotify
    wike
    zotero
    nucleus

    # Communication
    discord
    signal-desktop
    zulip

    # Creative
    musescore
    blender
    blockbench
    design

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
    inputs.pandora-nix.packages.x86_64-linux.default

    # Utility
    binary
    eyedropper
    gnome-decoder
    gnome-graphs
    gnome-solanum
    hieroglyphic
    ffmpeg
    gemini-cli
    delineate
    eloquent
    gnome-network-displays
    morphosis

    # Customization
    adw-gtk3
    gnome-control-center
    gnome-tweaks

    # Passwords
    proton-pass
    proton-authenticator
  ];
}
