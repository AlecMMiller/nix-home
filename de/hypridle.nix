{ config, ... }:

{
  config = {
    services.hypridle = {
      enable = config.bundles.gui;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          #after_sleep_cmd = "hyprlock";
        };
      };
    };
  };
}
