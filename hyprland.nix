{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "kitty";
      "$launcher" = "tofi-drun | xargs hyprctl dispatch exec --";

      bind = (
      builtins.concatMap(x: [
      "$mod, ${x}, moveworkspacetomonitor,${x} current"
      "$mod, ${x}, workspace, ${x}"
      "$mod SHIFT, ${x}, movetoWorkspace, ${x}"
      ]) ["1" "2" "3" "4" "5" "6" "7" "8" "9"] ++ [
        "$mod, Q, exec, $terminal"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, R, exec, $launcher"
        '',Print, exec, grim -g "$(slurp)"''
      ]
      );

      env = [
        "NVD_BACKEND,direct"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY,nvidia"
      ];

      general = {
        allow_tearing = true;
      };

      monitor = [
        "HDMI-A-1,preferred,0x0,1"
        "DP-1,preferred,-3840x0,1"
        "DP-2,preferred,-1920x0,1"
      ];

      exec-once = [
        "waybar"
        "discord"
        "lxqt-policykit-agent"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "immediate,class:^(google-chrome)$"
        "workspace 9 silent,class:^(discord)$"
        "workspace 8,initialTitle:^(Spotify)"
        "float,class:^(org.pulseaudio.pavucontrol)$"
      ];

      "$mod" = "SUPER";
    };
  };
}
