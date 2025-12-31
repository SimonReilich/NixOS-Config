{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Languages
    gcc15
    glibc
    rustup
    jdk17
    nil

    # Development Tools
    gnumake
    gh

    # Other
    texliveFull
    typst
    fzf
    direnv
    jless
    bat
    wl-clipboard
  ];

  programs.java.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
}
