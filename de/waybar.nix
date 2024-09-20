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
          output = [primary_monitor];
          layer = "top";
          position = "top";
          modules-left = ["hyprland/workspaces"];
          #modules-center = ["hyprland/workspaces"];
          modules-right = ["network" "battery" "pulseaudio" "clock"];
          clock = {
            format = "{:%H:%M}";
            tooltip-format = "{:%Y-%m-%d}";
          };
          network = {
            format-wifi = "   ";
            format-ethernet = "";
            tooltip-format-wifi = "{essid}";
          };
          battery = {
            full-at = 95;
            states = {
              warning = 30;
              critical = 15;
            };

            format-charging = "   ";
            format-full = "";
            format-plugged = "";
          };
          mpris = {
            format = "{artist} - {title}";
          };
          pulseaudio = {
            on-click = "pavucontrol";
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
        font-size = toString (10*scale);
        margin = toString (1);
        clockColor = "@text";
      makeBorder = color: "border-bottom: 3px solid ${color};";
      makeInfo = color: ''
        color: ${color};
      ${makeBorder color};
      '';
      in /* css */
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
          background-color: @base;
        }

        #network
        #clock,
        #pulseaudio {
          margin: 0px;
          padding-top: 0.5px;
          padding-bottom: 0.5px;
          padding-left: 6px;
          padding-right: 6px;
          background-color: @base;
          margin-top: ${margin}px;
          border-radius: 1px 0px 0px 1px;
        }

        #workspaces {
          background-color: @base;
          padding-top: 0px;
          padding-bottom: 0.5px;
          margin-top: ${margin}px;
          border-radius: 3px;
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

        #pulseaudio {
          padding-left: 12px;
        }

        #mpris {
          color: @text;
          background-color: @base;
          margin-top: 1px;
          padding-left: 12px;
          padding-right: 12px;
          border-radius: 20px;
          margin-left: 8px;
        }

        #clock {
          color: @text;
          border-radius: 0px 20px 20px 0px;
          padding-right: 12px;
          margin-right: 8px;
        }
      '';
    };
  };
}
