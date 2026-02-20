{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        kb_layout = "de";
        numlock_by_default = true;

        follow_mouse = 1;
        touchpad = {
          disable_while_typing = true;
          natural_scroll = false;
        };
      };

      bind = [
        "SUPER, Q, exec, ghostty"
        "SUPER, C, killactive"
        "SUPER, M, exit"
        "SUPER, V, togglefloating"
        "SUPER, F, fullscreen"

        "SUPER, h, movefocus, l"
        "SUPER, j, movefocus, d"
        "SUPER, k, movefocus, u"
        "SUPER, l, movefocus, r"

        "SUPER, Right, workspace, r+1"
        "SUPER, Left, workspace, r-1"

        "SUPER_SHIFT, Right, movetoworkspace, r+1"
        "SUPER_SHIFT, Left, movetoworkspace, r-1"

        "SUPER_SHIFT, W, exec, pkill waybar || waybar"
      ];

      binds = {
        workspace_back_and_forth = true;
        allow_workspace_cycles = true;
      };

      cursor = {
        hide_on_key_press = true;
      };
    };
  };
}
