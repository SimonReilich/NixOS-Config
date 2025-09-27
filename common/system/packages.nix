{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Languages
    gcc
    jdk17

    # Development Tools
    gnumake
    gh

    # Other
    texliveFull
    tex-fmt
    typst
    typstyle
  ];

  programs.java.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
}
