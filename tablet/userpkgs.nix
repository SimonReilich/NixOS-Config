{ config, pkgs, ... }:

{
  users.users.simonr.packages = with pkgs; [
    geteduroam-cli
  ];
}
