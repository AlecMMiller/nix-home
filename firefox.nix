{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Alec";
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [ ublock-origin ];
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}
