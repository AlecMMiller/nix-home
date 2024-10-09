{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableFishIntegration = true;
    };
    settings = {
      window_margin_width = 2;
      #background_opacity = "0.85";
      #dynamic_background_opacity = true;
    };
  };
}
