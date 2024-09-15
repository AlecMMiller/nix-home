{ ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          color = "rgb(0, 0, 0";
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          font_color = "rgb(100, 100, 100)";
          placeholder_text = "Locked";
        }
      ];
    };
  };
}
