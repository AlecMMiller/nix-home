{ config, ... }:
let
  primary_monitor = if config.bundles.desktop then "DP-2" else "eDP-1";
in
{
  config = {
    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          output = [ primary_monitor ];
          layer = "top";
          position = "top";
          modules-left = [ "hyprland/workspaces" ];
          #modules-center = ["hyprland/workspaces"];
          modules-right = [
            "network"
            "battery"
            "pulseaudio"
            "clock"
          ];
          clock = {
            format = "{:%H:%M}";
            tooltip-format = "{:%Y-%m-%d}";
          };
          network = {
            format-wifi = "";
            format-ethernet = "";
            format-disconnected = "⚠";
            tooltip-format-wifi = "{essid}";
          };
          battery = {
            full-at = 95;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon}";
            format-charging = "";
            format-full = "";
            format-plugged = "";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
          mpris = {
            format = "{artist} - {title}";
          };
          pulseaudio = {
            on-click = "pavucontrol";
            format = "{icon}";
            format-muted = "";
            format-icons = [
              ""
              ""
              ""
            ];
          };
          tray = {
            spacing = 10;
          };
          "hyprland/workspaces" = {
            all-outputs = true;
            format = "{icon}";
            format-icons = {
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "7" = "";
              "8" = "󰝚";
              "9" = "󰍡";
            };
          };
        };
      };

      style =
        let
          scale = 1;
          font-size = toString (10 * scale);
          margin = toString (1);
        in
        # css
        ''
          * {
            margin: 0px;
            padding: 0px;
            border: none;
            border-radius: 0;
            font-family: Source Code Pro;
            font-size: ${font-size}px;
          }

          window#waybar {
            background-color: @crust;
          }

          #battery,
          #network,
          #clock,
          #pulseaudio {
            margin: 0px;
            padding-top: 0.5px;
            padding-bottom: 0.5px;
            padding-right: 15px;
            margin-top: ${margin}px;
            background-color: @crust;
          }

          #workspaces {
            padding-top: 0px;
            padding-bottom: 0.5px;
            margin-top: ${margin}px;
            background-color: @crust;
          }

          #workspaces button {
            color: @text;
          }
          #workspaces button.empty {
            color: @overlay1;
          }
          #workspaces button.visible {
            color: @teal;
          }
          #workspaces button.hosting-monitor button.visible {
            color: @green;
          }

          #battery.critical {
            color: @red;
          }

          #battery.warning {
            color: @yellow;
          }

          #mpris {
            color: @text;
            margin-top: 1px;
            padding-left: 12px;
            padding-right: 12px;
            border-radius: 20px;
            margin-left: 8px;
          }

          #clock {
            background-color: @crust;
            color: @text;
            padding-right: 12px;
            margin-right: 8px;
          }
        '';
    };
  };
}
