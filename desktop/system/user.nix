{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
    sha256 = "026rvynmzmpigax9f8gy9z67lsl6dhzv2p6s8wz4w06v3gjvspm1";
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simonr = {
    isNormalUser = true;
    description = "Simon Reilich";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager.users.simonr =
    { pkgs, ... }:

    {
      imports = [
        ../../common/user
        ../user
      ];

      # This value determines the Home Manager release that your configuration is
      # compatible with. This helps avoid breakage when a new Home Manager release
      # introduces backwards incompatible changes.
      #
      # You should not change this value, even if you update Home Manager. If you do
      # want to update the value, then make sure to first check the Home Manager
      # release notes.
      home.stateVersion = "24.05"; # Please read the comment before changing.

    };
}
