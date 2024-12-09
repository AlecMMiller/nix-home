{ config, ... }:

{
  config = {
    programs.hyprlock = {
      enable = config.bundles.gui;

      settings = {
        general = {
          hide_cursor = true;
          no_fade_in = true;
        };

        background = [
          {
            color = "rgb(30, 30, 46);";
          }
        ];

        input-field = [
          {
            monitor = "";
            font_size = 30;
            size = "450, 75";
            outline_thickness = 4;
            dots_size = 0.4;
            dots_spacing = 0.4;
            dots_center = true;
            fail_color = "rgb(205,215,244";
            outer_color = "rgb(180, 190, 254)";
            inner_color = "rgb(49, 50, 68)";
            font_color = "rgb(205, 214, 244)";
            fade_on_empty = true;
            placeholder_text = "Logged in as $USER";
            hide_input = true;
            check_color = "rgb(205,215,244)";
            position = "0, -47";
            halign = "center";
            valign = "center";
          }
        ];

        label = [
          {
            monitor = "";
            text = "$TIME";
            color = "rgb(205,214,244)";
            font_size = 120;
            position = "-45, 0";
            halign = "right";
            valign = "top";
          }
          {
            monitor = "";
            text = ''cmd[update:43200000] date +"%A, %d %B %Y"'';
            #text = "foo";
            color = "rgb(205,214,244);";
            font_size = 37;
            position = "-45, -200";
            halign = "right";
            valign = "top";
          }
        ];
      };
    };
  };
}
