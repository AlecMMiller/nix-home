{ config, ... }:

{
  gtk = {
    enable = config.bundles.gui;
    catppuccin.enable = true;
  };
}
