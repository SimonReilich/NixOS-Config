{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simonr = {
    isNormalUser = true;
    description = "Simon Reilich";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
