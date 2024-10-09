{ pkgs, ... }:

{
  imports = [ ./plugins ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        #transparent_background = true;
      };
    };

    globals = {
      mapleader = " ";
    };

    opts = {
      clipboard = "unnamedplus";
      number = true;
      relativenumber = true;
    };

  };
}
