{ config, pkgs, lib, ... }:

{
  programs.tofi = {
    enable = true;
    settings = {
      border-width = 0;
      outline-width = 1;
      corner-radius = 10;
      font-size = 12;
      padding-top = 64;
      padding-bottom = 64;
      padding-left = 64;
      padding-right = 64;
    };
  };
}
