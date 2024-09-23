{ pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [ fcitx5-mozc ];
      inputs = [
        {
          name = "Default";
          defaultLayout = "us";
          defaultIm = "mozc";
          items = [
            {
              name = "keyboard-us";
            }
            {
              name = "mozc";
            }
          ];
        }
      ];
    };
  };
}
