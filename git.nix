{ config, lib, ... }:
let
  email = "alecmichaelmiller@gmail.com";
in
with lib;
{
  config = {
    programs.git = mkIf config.bundles.gui {
      enable = true;
      userEmail = email;
      userName = "Alec Miller";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        push = {
          autoSetupRemote = true;
        };
        pull = {
          rebase = false;
        };
      };
      signing = {
        key = email;
        signByDefault = true;
      };
    };
  };
}
