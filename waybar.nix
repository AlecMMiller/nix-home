{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        output = ["DP-2"];
        layer = "top";
        position = "top";
        modules-center = ["hyprland/workspaces"];
        modules-right = ["pulseaudio" "clock"];
        clock.format = "{:%H:%M}";
        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{name}";
        };
      };
    };

    style =
      let
      clockColor = "@text";
      makeBorder = color: "border-bottom: 3px solid ${color};";
      makeInfo = color: ''
        color: ${color};
        ${makeBorder color};
      '';
    in
    ''
      * {
        border: none;
        border-radius: 0;
        font-family: Source Code Pro;
      }
      window#waybar {
        background-color: @crust;
      }
      #clock,
      #pulseaudio {
        margin: 0px;
        padding-top: 1px;
        padding-bottom: 1px;
        padding-left: 6px;
        padding-right: 6px;
        background-color: @base;
        margin-top: 4px;
        margin-bottom: 4px;
        border-radius: 20px 0px 0px 20px;
      }
      #workspaces {
        background-color: @base;
        padding-top: 1px;
        padding-bottom: 1px;
        margin-top: 4px;
        margin-bottom: 4px;
        border-radius: 20px;
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
      #workspaces button.hosting-monitor {
        color: @green;
      }
      #pulseaudio {
        padding-left: 12px;
      }
      #clock {
        color: @text;
        border-radius: 0px 20px 20px 0px;
        padding-right: 12px;
        margin-right: 8px;
      }
    '';

  };
}
