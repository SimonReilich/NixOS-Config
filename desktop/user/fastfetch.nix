{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "NixOS";
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
        "break"
        "uptime"
        "processes"
        "packages"
        "break"
        "shell"
        "editor"
        "de"
        "break"
        "cpu"
        "gpu"
        "memory"
        "break"
        "mouse"
        "keyboard"
      ];
    };
  };
}
