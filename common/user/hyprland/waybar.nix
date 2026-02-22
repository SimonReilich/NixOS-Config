{
  pkgs,
  ...
}:

let
  show-seperator = pkgs.writeShellScript "show-seperator.sh" ''
    if hyprctl clients -j | jq -e 'length > 0' > /dev/null; then
        printf '{"text": " "}\n'
    else
        printf '{"text": ""}\n'
    fi
  '';

  check-updates = pkgs.writeShellScript "check-updates.sh" ''
    cd ~/.dotfiles
    git fetch origin

    LOCAL=$(git rev-parse "main")
    REMOTE=$(git rev-parse "origin/main")
    BASE=$(git merge-base "main" "origin/main")

    if [ "$LOCAL" = "$REMOTE" ]; then
        printf '{"text": "", "tooltip": "Up to date", "class": ""}\n'
    elif [ "$LOCAL" = "$BASE" ]; then
        printf '{"text": "󰚰", "tooltip": "There are updates available", "class": ""}\n'
    elif [ "$REMOTE" = "$BASE" ]; then
        printf '{"text": "󰕒", "tooltip": "Your config is ahead of the repo", "class": ""}\n'
    else
        printf '{"text": "", "tooltip": "You have diverged", "class": "needs-attention"}\n'
    fi
  '';

  update = pkgs.writeShellScript "update.sh" ''
    (cd ~/.dotfiles && git add * && git pull && sudo nixos-rebuild switch --flake ~/.dotfiles && sudo nix-collect-garbage --delete-older-than 7d)
  '';

  update-button = pkgs.writeShellScript "update-button.sh" ''
    cd ~/.dotfiles
    git fetch origin

    LOCAL=$(git rev-parse "main")
    REMOTE=$(git rev-parse "origin/main")
    BASE=$(git merge-base "main" "origin/main")

    if [ "$LOCAL" = "$REMOTE" ]; then
        exit 0
    elif [ "$LOCAL" = "$BASE" ]; then
        ghostty --wait-after-command=true -e zsh -c "bash ${update}"
    elif [ "$REMOTE" = "$BASE" ]; then
        code .
    else
        code .
    fi
  '';
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [
          "clock"
          "custom/updates"
        ];
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
          on-click = "swaync-client -t";
        };

        "custom/updates" = {
          interval = 3600;
          format = "{}";
          exec = "${check-updates}";
          on-click = "${update-button}";
          return-type = "json";
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
        modules-center = [
          "custom/chromium"
          "custom/spotify"
          "custom/obsidian"
          "custom/discord"
          "custom/taskbar-separator"
          "wlr/taskbar"
        ];
        modules-right = [ "hyprland/window" ];

        "custom/chromium" = {
          format = "<span font='Google Sans Flex @wdth=150' size='small'> </span>";
          tooltip-format = "Chromium";
          on-click = "hyprctl clients -j | jq -r '.[] | select(.initialClass == \"chromium-browser\") | .workspace.id' | head -n 1 | { read -r wid; if [ -n \"$wid\" ]; then hyprctl dispatch workspace \"$wid\" && hyprctl dispatch focuswindow initialClass:\"chromium-browser\"; else chromium; fi; }";
        };

        "custom/spotify" = {
          format = "󰓇";
          tooltip-format = "Spotify";
          on-click = "hyprctl clients -j | jq -r '.[] | select(.initialClass == \"spotify\") | .workspace.id' | head -n 1 | { read -r wid; if [ -n \"$wid\" ]; then hyprctl dispatch workspace \"$wid\" && hyprctl dispatch focuswindow initialClass:\"spotify\"; else spotify; fi; }";
        };

        "custom/obsidian" = {
          format = "󱓧<span font='Google Sans Flex @wdth=10' size='xx-small'> </span>";
          tooltip-format = "Obsidian";
          on-click = "hyprctl clients -j | jq -r '.[] | select(.initialClass == \"obsidian\") | .workspace.id' | head -n 1 | { read -r wid; if [ -n \"$wid\" ]; then hyprctl dispatch workspace \"$wid\" && hyprctl dispatch focuswindow initialClass:\"obsidian\"; else obsidian; fi; }";
        };

        "custom/discord" = {
          format = "<span size='small'></span><span font='Google Sans Flex @wdth=400' size='medium'> </span>";
          tooltip-format = "Discord";
          on-click = "hyprctl clients -j | jq -r '.[] | select(.initialClass == \"discord\") | .workspace.id' | head -n 1 | { read -r wid; if [ -n \"$wid\" ]; then hyprctl dispatch workspace \"$wid\" && hyprctl dispatch focuswindow initialClass:\"discord\"; else discord; fi; }";
        };

        "custom/taskbar-separator" = {
          exec = "${show-seperator}";
          return-type = "json";
          interval = 0.25;
        };

        "wlr/taskbar" = {
          format = "{app_id}";
          tooltip-format = "{title} ({app_id})";
          on-click = "activate";
          on-click-middle = "minimize";
          icon-size = 36;
          markup = true;
          rewrite = {
            "git-credential-manager" = "<span font='Google Sans Flex @wdth=120' size='xx-small'> </span>󰊢";
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
            "discord" =
              "<span font='Google Sans Flex @wdth=140' size='x-small'> </span><span size='small'></span>";
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
        background: transparent;
        color: rgb(231, 229, 232);
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
        color: rgb(231, 229, 232);
        padding: 16px;
        box-shadow:
          0px 2px 2px 0px rgba(0, 0, 0, 0.2);
      }

      #clock {
        margin-left: 16px;
        font-size: 14px;
      }

      #custom-updates {
        background: transparent;
        color: rgb(231, 229, 232);
        margin: 4px;
        margin-left: 32px;
        padding: 0px 14.5px 0px 9.5px;
      }

      #custom-updates.needs-attention {
        background: rgb(238, 103, 92);
        color: rgb(96, 20, 16);
        border-radius: 24px;
      }

      #tray {
        background: rgb(193, 198, 213);
        border-radius: 24px;
        padding: 0px 10px;
        margin: 4px;
        margin-right: 32px;
      }

      #tray > .needs-attention {
        background: rgb(238, 103, 92);
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

      #custom-taskbar-separator {
        background: rgb(105, 103, 104);
        padding: 2px;
        margin: 16px;
        margin-left: 12px;
        margin-right: 12px;
        border-radius: 16px;
        font-size: 1px;
      }

      #custom-chromium,
      #custom-spotify,
      #custom-obsidian,
      #custom-discord,
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

      #custom-chromium:hover,
      #custom-spotify:hover,
      #custom-obsidian:hover,
      #custom-discord:hover,
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
        color: rgba(231, 229, 232, 0.5);
        border: none;
        box-shadow: none;
        font-size: 12px;
        transition: all 0.3s ease;
      }

      #workspaces button.active {
        color: rgb(231, 229, 232);
        font-size: 16px;
      }

      #workspaces button:only-child {
        color: transparent;
      }

      #workspaces button:hover {
        color: rgb(231, 229, 232);
      }

      #workspaces button.urgent {
        color: rgb(238, 103, 92);
      }
    '';
  };
}
