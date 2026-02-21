{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      max-history = 50;
      actions = 1;
      font = "Google Sans Flex @wght=600,wdth=100,ROND=100'";
      background-color = "#19191b";
      text-color = "#e7e5e8";
      width = 512;
      height = 1024;
      margin = 16;
      padding = 16;
      border-size = 0;
      border-radius = 24;
      icons = 1;
      layer = "overlay";
      max-visible = 3;
      max-icon-size = 64;
      icon-border-radius = 32;
      default-timeout = 10000;
      anchor = "top-left";
      format = "<span font='Google Sans Flex @wght=600,wdth=100,ROND=100'>%a: %s</span>\\n<span font='Google Sans Flex @wght=400,wdth=100,ROND=0'>%b</span>";
    };

    extraConfig = ''
      [urgency=high]
      border-color=#f38ba8
      default-timeout=0
    '';
  };
}
