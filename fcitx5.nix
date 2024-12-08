{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  config = {
    i18n.inputMethod = mkIf config.bundles.gui {
      enabled = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [ fcitx5-mozc ];
      };
    };
  };
}
