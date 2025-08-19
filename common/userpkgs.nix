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
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        brettm12345.nixfmt-vscode
      ];
    })

    # Utility
    binary
    emblem
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
