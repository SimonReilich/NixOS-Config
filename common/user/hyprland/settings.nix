{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        layout = "master";

        border_size = 0;
        gaps_in = 5;
        gaps_out = 0;
        float_gaps = 10;

        resize_on_border = true;
        extend_border_grab_area = 20;
        hover_icon_on_border = true;

        snap.enabled = true;
      };

      decoration = {
        rounding = 16;
        rounding_power = 2.5;

        blur.enabled = false;
        dim_inactive = true;
        dim_strength = 0.2;

        shadow = {
          enabled = true;
          range = 25;
          render_power = 3;
          color = "rgba(00000044)";
        };
      };

      ecosystem = {
        no_update_news = false;
        no_donation_nag = true;
      };

      animations = {
        enabled = true;
        bezier = "md3_standard, 0.2, 0, 0, 1";
        animation = [
          "windows, 1, 6, md3_standard, slide"
          "workspaces, 1, 7, md3_standard, slide"
        ];
        workspace_wraparound = true;
      };
    };
  };
}
