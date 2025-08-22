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
        "OS"
        "Kernel"
        "Init System"

        "break"

        "Uptime"
        "Processes"
        "Packages"

        "break"

        "Shell"
        "Editor"
        "DE"
        "WM"
        "Terminal"

        "break"

        "Board"
        "CPU"
        "CPU Cache (L1)"
        "CPU Cache (L2)"
        "CPU Cache (L3)"
        "CPU Ussage"
        "GPU 1"
        "GPU 2"
        "Memory"
        "Disk (/)"

        "break"

        "Mouse"
        "Keyboard"
        "Display (Xiaomi Corporation 52\")"
        "Sound"

        "break"

        "Date & Time"
        "Weather"
      ];
    };
  };
}
