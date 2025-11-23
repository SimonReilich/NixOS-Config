{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
}
