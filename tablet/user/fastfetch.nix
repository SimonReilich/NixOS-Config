{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "NixOS";
        padding = {
          left = 2;
        };
      };
      display = {
        color = "blue";
        separator = ": ";
      };
      modules = [
        "title"
        "break"
        "os"
        "kernel"
        "board"
        "break"
        "uptime"
        "processes"
        "packages"
        "break"
        "shell"
        "editor"
        "de"
        "wm"
        "break"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "battery"
      ];
    };
  };
}
