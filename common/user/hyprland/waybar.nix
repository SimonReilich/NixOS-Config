{
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "clock" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "network"
          "pulseaudio"
        ];

        "clock" = {
          format = "{:%H:%M %a., %d. %b.}";
        };

        "hyprland/window" = {
          format = "{title}";
        };

        "network" = {
          format-wifi = " {essid}";
          format-ethernet = "󰈀 {ifname}: {ipaddr}/{cidr}";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = " unconnected";
        };

        "pulseaudio" = {
          format = " {volume}%";
          format-muted = " muted";
          on-click = "pulsemixer --toggle-mute";
        };
      };

      taskBar = {
        layer = "top";
        position = "bottom";
        height = 64;
        modules-left = [ ];
        modules-center = [ "wlr/taskbar" ];
        modules-right = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        "hyprland/workspaces" = {
          disable_scroll = true;
          all_outputs = true;
          format = "{icon}";
          format-icons = {
            default = "●";
            active = "●";
            urgent = "🞿";
          };
          tooltip = true;
          tooltip-format = "{windows}";
        };

        "wlr/taskbar" = {
          format = "{icon}";
          on-click = "activate";
          on-click-middle = "minimize";
          icon-size = 40;
        };

        "hyprland/window" = {
          format = "";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "Google Sans Flex, sans-serif";
        font-weight: 500;
      }

      window#waybar.top > box,
      window#waybar.bottom > box {
        margin-left: 24px;
        margin-right: 24px;
      }

      window#waybar.top {
        background: rgba(0, 0, 0, 0.0);
        color: rgb(193, 198, 213);
        font-size: 14px;
      }

      window#waybar.bottom {
        background: rgb(19, 19, 20);
        color: rgb(193, 198, 213);
        transition: background 0.3s ease;
      }

      window#waybar.bottom.empty,
      window#waybar.bottom.floating {
        background: transparent;
        color: rgb(193, 198, 213);
      }

      #taskbar button:hover {
        background: transparent;
      }

      #workspaces button {
        min-height: 64px;

        padding: 0 5px;
        background: transparent;
        color: rgba(193, 198, 213, 0.5);
        border: none;
        box-shadow: none;
        transition: all 0.3s ease;
      }

      #workspaces button.active {
        color: rgb(193, 198, 213);
        font-size: 24px;
      }

      #workspaces button:hover {
        color: rgb(193, 198, 213);
      }

      #workspaces button.urgent {
        color: rgb(238, 103, 92);
      }
    '';
  };
}
