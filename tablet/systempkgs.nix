{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Gnome
    gnomeExtensions.app-hider
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.forge
    gnomeExtensions.gsconnect
    gnomeExtensions.rounded-window-corners-reborn

    # Languages
    jdk21_headless

    # Development Tools
    gnumake
    git
    git-credential-manager
    gh

    # System
    libwacom-surface
    linux-firmware
  ];

  programs.java.enable = true;
}
