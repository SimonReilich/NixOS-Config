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
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "bluetooth"
          "network"
          "battery"
        ];

        "clock" = {
          format = "<span font='Google Sans Flex @wght=600,wdth=100,ROND=100'>{:%H:%M  %a., %d. %b.}</span>";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          disable_scroll = true;
          all_outputs = true;
          format = "{icon}";
          format-icons = {
            default = "●";
            active = "●";
            urgent = "🞿";
          };
          on_click = "activate";
          tooltip = false;
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
        };

        "pulseaudio" = {
          format = "󰕾 ";
          format-muted = "󰝟 ";
          on-click = "pulsemixer --toggle-mute";
          on-scroll-up = "pulsemixer --change-volume +1";
          on-scroll-down = "pulsemixer --change-volume -1";
          tooltip-format = "{desc} ({volume}%)";
        };

        "bluetooth" = {
          format = "󰂲 ";
          format-connected = "󰂯 {device_alias}";
          format-connected-battery = "󰥉 {device_alias} {device_battery_percentage}%";
          tooltip-format = "{num_connections} connected";
          tooltip-format-connected = "{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_battery_percentage}%";
        };

        "network" = {
          format-wifi = "󰤨 ";
          format-ethernet = "󰈀";
          format-linked = "";
          format-disconnected = "󰌙 ";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
        };

        "battery" = {
          interval = 60;
          format = "{icon}";
          tooltip-format = "{timeTo} ({capacity}%)";
          format-icons = {
            default = [
              " "
              " "
              " "
              " "
              " "
            ];
            charging = "󰚥";
          };
        };
      };

      taskBar = {
        layer = "top";
        position = "bottom";
        height = 64;
        modules-left = [ ];
        modules-center = [ "wlr/taskbar" ];
        modules-right = [ "hyprland/window" ];

        "wlr/taskbar" = {
          format = "{app_id}";
          tooltip-format = "{title} ({app_id})";
          on-click = "activate";
          on-click-middle = "minimize";
          icon-size = 36;
          markup = true;
          rewrite = {
            "git-credential-manager" = "<span font='Google Sans Flex @wdth=80' size='xx-small'> </span>󰊢";
            "com.mitchellh.ghostty" = "<span font='Google Sans Flex @wdth=600' size='small'> </span>";
            "org.gnome.nautilus" = "<span font='Google Sans Flex @wdth=130' size='xx-small'> </span>";
            "steam" = "<span font='Google Sans Flex @wdth=150' size='xx-small'> </span>";
            "chromium-browser" = "<span font='Google Sans Flex @wdth=140' size='xx-small'> </span>";
            "thunderbird" = "<span font='Google Sans Flex @wdth=100' size='xx-small'> </span>";
            "obsidian" = "<span font='Google Sans Flex @wdth=90' size='xx-small'> </span>󱓧";
            "org.gnome.gitlab.somas.Apostrophe" =
              "<span font='Google Sans Flex @wdth=120' size='xx-small'> </span>󰼭";
            "ONLYOFFICE" = "<span font='Google Sans Flex @wdth=100' size='xx-small'> </span>󰏆";
            "io.gitlab.adhami3310.Converter" =
              "<span font='Google Sans Flex @wdth=100' size='xx-small'> </span>󱨀";
            "org.gnome.gitlab.YaLTeR.VideoTrimmer" =
              "<span font='Google Sans Flex @wdth=130' size='xx-small'> </span>";
            "com.github.flxzt.rnote" = "<span font='Google Sans Flex @wdth=150' size='xx-small'> </span>";
            "spotify" = "<span font='Google Sans Flex @wdth=120' size='xx-small'> </span>󰓇";
            "com.github.hugolabe.Wike" = "<span font='Google Sans Flex @wdth=45' size='xx-small'> </span>";
            "Zotero" = "<span font='Google Sans Flex @wdth=50' size='xx-small'> </span>󱛊";
            "page.codeberg.lo_vely.Nucleus" =
              "<span font='Google Sans Flex @wdth=110' size='xx-small'> </span>󰝨";
            "discord" = "<span font='Google Sans Flex @wdth=80' size='x-small'> </span>";
            "signal" = "<span font='Google Sans Flex @wdth=120' size='x-small'> </span>";
            "Zulip" = "<span font='Google Sans Flex @wdth=120' size='xx-small'> </span>";
            "Blender" = "<span font='Google Sans Flex @wdth=150' size='xx-small'> </span>";
            "Blockbench" = "<span font='Google Sans Flex @wdth=90' size='x-small'> </span>";
            "Godot" = "<span font='Google Sans Flex @wdth=200' size='small'> </span>";
            "page.kramo.Cartridges" = "<span font='Google Sans Flex @wdth=120' size='xx-small'> </span>󰺵";
            "PandoraLauncher" = "<span font='Google Sans Flex @wdth=110' size='xx-small'> </span>󰍳";
            "io.github.fizzyizzy05.binary" = "<span font='Google Sans Flex @wdth=90' size='x-small'> </span>";
            "com.github.finefindus.eyedropper" =
              "<span font='Google Sans Flex @wdth=130' size='xx-small'> </span>";
            "io.github.finefindus.Hieroglyphic" =
              "<span font='Google Sans Flex @wdth=150' size='xx-small'> </span>";
            "io.github.seadve.Delineate" = "<span font='Google Sans Flex @wdth=110' size='xx-small'> </span>󱁉";
            "garden.jamie.Morphosis" = "<span font='Google Sans Flex @wdth=150' size='xx-small'> </span>";
            "Proton Pass" = "<span font='Google Sans Flex @wdth=140' size='xx-small'> </span>";
            "proton-authenticator" = "<span font='Google Sans Flex @wdth=110' size='xx-small'> </span>󰦯";
            "code" = "<span font='Google Sans Flex @wdth=200' size='xx-small'> </span>";
          };
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
        font-family: "Google Sans Flex", "Material Design Icons", "Roboto";
        font-weight: 500;
      }

      window#waybar.top {
        background: rgba(0, 0, 0, 0.0);
        color: rgb(193, 198, 213);
        font-size: 18px;
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

      tooltip {
        padding: 12px;
        background: transparent;
      }

      tooltip label {
        background: rgb(25, 25, 27);
        border-radius: 32px;
        color: rgb(193, 198, 213);
        padding: 16px;
        box-shadow:
          0px 2px 2px 0px rgba(0, 0, 0, 0.2);
      }

      #clock {
        margin-left: 16px;
        font-size: 14px;
      }

      #tray {
        background-color: rgb(193, 198, 213);
        border-radius: 24px;
        padding: 2px 10px;
        margin: 4px;
        margin-right: 32px;
      }

      #tray > .needs-attention {
        background-color: rgb(238, 103, 92);
      }

      #bluetooth {
        margin-left: 15px;
        margin-right: 0px;
      }

      #network {
        margin-left: 14px;
        margin-right: 16px;
      }

      #battery {
        margin-left: 0px;
        margin-right: 16px;
        font-size: 20px;
      }

      #taskbar button {
        color: rgb(193, 198, 214);
        background: rgb(46, 48, 54);
        transition: all 0.3s ease;
        margin: 8px;
        margin-left: 16px;
        margin-right: 16px;
        font-size: 36px;
        border-radius: 16px;
        min-width: 48px;
        padding: 0px 0px 0px 0px;
      }

      #taskbar button.active,
      #taskbar button:hover {
        background: rgb(193, 198, 214);
        color: rgb(46, 48, 54);
      }

      #taskbar button.urgent {
        background: rgb(96, 20, 16);
        color: rgb(238, 103, 92);
      }

      #workspaces button {
        min-height: 32px;

        padding: 0 5px;
        background: transparent;
        color: rgba(193, 198, 213, 0.5);
        border: none;
        box-shadow: none;
        font-size: 12px;
        transition: all 0.3s ease;
      }

      #workspaces button.active {
        color: rgb(193, 198, 213);
        font-size: 16px;
      }

      #workspaces button:only-child {
        color: rgba(193, 198, 213, 0);
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
