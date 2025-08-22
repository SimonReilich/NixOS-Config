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
        "Uptime"
        "Packages"
        "Shell"
        "Editor"
        "DE"
        "WM"
        "Terminal"
        "CPU"
        "GPU 1"
        "Memory"
        "Weather"
      ];
    };
  };
}
