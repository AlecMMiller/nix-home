{ config, lib, ... }:
with lib;
{
  config = {
    programs.git = mkIf config.bundles.gui {
      enable = true;
      userEmail = "alecmichaelmiller@gmail.com";
      userName = "Alec Miller";
      extraConfig = {
        push = {
          autoSetupRemote = true;
        };
        pull = {
          rebase = false;
        };
      };
      signing = {
        key = "alecmichaelmiller@gmail.com";
        signByDefault = true;
      };
    };
  };
}
