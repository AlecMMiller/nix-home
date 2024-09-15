{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [
        "~/.config/home-manager/media/1.jpg"
        "~/Pictures/3.jpg"
        "~/Pictures/2.jpg"
        "~/Pictures/4.jpg"
      ];
      wallpaper = [
        "DP-1,~/Pictures/2.jpg"
        "DP-2,~/Pictures/4.jpg"
        "HDMI-A-1,~/Pictures/3.jpg"
        "eDP-1,~/.config/home-manager/media/1.jpg"
      ];
    };
  };
}
