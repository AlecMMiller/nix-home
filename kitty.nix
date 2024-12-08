{ config, ... }:

{
  programs.kitty = {
    enable = config.bundles.gui;
    shellIntegration = {
      enableFishIntegration = true;
    };
    settings = {
      window_margin_width = 2;
    };
  };
}
