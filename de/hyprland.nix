{ config, lib, ... }:
with lib;
let
  monitor =
    if config.bundles.desktop then
      [
        "HDMI-A-1,preferred,0x0,1"
        "DP-1,preferred,-3840x0,1"
        "DP-2,preferred,-1920x0,1"
      ]
    else
      [
        "eDP-1,preferred,0x0,2,vrr,1"
        "Unknown-1,disable"
      ];
in
{
  config = {
    wayland.windowManager.hyprland = {
      enable = config.bundles.gui;
      settings = {
        "$terminal" = "kitty";
        "$launcher" = "tofi-drun | xargs hyprctl dispatch exec --";

        bind = (
          builtins.concatMap
            (x: [
              "$mod, ${x}, moveworkspacetomonitor,${x} current"
              "$mod, ${x}, workspace, ${x}"
              "$mod SHIFT, ${x}, movetoWorkspace, ${x}"
            ])
            [
              "1"
              "2"
              "3"
              "4"
              "5"
              "6"
              "7"
              "8"
              "9"
            ]
          ++ [
            "$mod, A, exec, $terminal"
            "$mod, C, killactive"
            "$mod, M, exit"
            "$mod, S, exec, $launcher"
            "$mod, H, movefocus, l"
            "$mod, J, movefocus, d"
            "$mod, K, movefocus, u"
            "$mod, L, movefocus, r"
            "$mod, F, fullscreen"

            '',Print, exec, grim -g "$(slurp)" $HOME/screenshots/$(date +'%s_grim.png')''

            ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
            ", XF86AudioNext, exec, playerctl next"
          ]
        );

        env =
          [
            "XDG_SESSION_TYPE,wayland"
          ]
          ++ lists.optionals config.bundles.desktop [
            "NVD_BACKEND,direct"
            "ELECTRON_OZONE_PLATFORM_HINT,auto"
            "LIBVA_DRIVER_NAME,nvidia"
            "GRM_BACKEND,nvidia-drm"
            "__GLX_VENDOR_LIBRARY,nvidia"
          ];

        general = {
          allow_tearing = true;
          gaps_out = 10;
        };

        monitor = monitor;

        exec-once = [
          "[workspace 1 silent] firefox"
          "waybar"
          "[workspace 9 silent] discord"
          "[workspace 8 silent] spotify"
          "lxqt-policykit-agent"
        ];

        animations.enabled = 0;

        decoration = {
          rounding = 2;
          blur = {
            enabled = true;
            size = 8;
            passes = 1;

            vibrancy = 0.1696;
          };
        };

        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "float,class:^(org.pulseaudio.pavucontrol)$"
          "workspace 9 silent,class:^(discord)$"
          "workspace 4 silent,class:^(cortex)$"
          "tile,class:^(blender)$"
          "bordersize 0, floating:0, onworkspace:w[tv1]"
          "rounding 0, floating:0, onworkspace:w[tv1]"
          "bordersize 0, floating:0, onworkspace:f[1]"
          "rounding 0, floating:0, onworkspace:f[1]"
        ];

        workspace = [
          "w[tv1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];

        "$mod" = "SUPER";

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };
      };
    };
  };
}
