{ config, lib, ... }:
let
  userInfo = import ./user.nix { };
in
with lib;
{
  config = {
    programs.git = mkIf config.bundles.gui {
      enable = true;
      userEmail = userInfo.email;
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
        key = userInfo.email;
        signByDefault = config.bundles.gui;
      };
    };
  };
}
