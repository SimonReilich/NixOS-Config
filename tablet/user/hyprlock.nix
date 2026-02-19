{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "/home/simonr/.dotfiles/desktop/wallpaper.png";
          color = "rgba(25, 20, 20, 1.0)";
          blur_passes = 1;
          blur_size = 0;
          brightness = 0.8;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "560, 120";
          outline_thickness = 4;
          dots_size = 0.3;
          dots_spacing = 0.35;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0)";
          font_color = "rgb(c1c6d5)";

          check_color = "rgba(0, 0, 0, 0)";
          fail_color = "rgba(0, 0, 0, 0)";

          font_family = "Google Sans Flex";
          fade_on_empty = false;
          rounding = -1;
          placeholder_text = "<span font='Google Sans Flex @wght=600,wdth=100,ROND=100'>Unlock with PIN</span>";
          hide_input = false;
          position = "0, -460";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span font='Google Sans Flex @wght=200,wdth=125,ROND=100'>$(date +"%H")</span>"'';
          color = "rgb(c1c6d5)";
          font_size = 360;
          position = "0, 400";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span font='Google Sans Flex @wght=200,wdth=125,ROND=100'>$(date +"%M")</span>"'';
          color = "rgb(c1c6d5)";
          font_size = 360;
          position = "0, 20";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span font='Google Sans Flex @wght=600,wdth=100,ROND=100'>$(date +"%a., %d. %b.") $(curl -s 'wttr.in?format=%c%t')</span>"'';
          color = "rgb(c1c6d5)";
          font_size = 32;
          position = "0, -230";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
