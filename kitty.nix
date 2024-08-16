{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableFishIntegration = true;
    };
    settings = {
      background_opacity = "0.85";
      dynamic_background_opacity = true;
    };
  };
}
