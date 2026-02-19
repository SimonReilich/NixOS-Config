{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./chromium.nix
    ./email.nix
    ./neovim.nix
    ./obsidian.nix
    ./packages.nix
    ./prompt.nix
    ./vscode.nix
    ./hyprland
  ];
}
