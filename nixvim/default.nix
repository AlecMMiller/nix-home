{ pkgs, inputs, ... }:
{
  imports = [
    ./plugins
    ./keymaps.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        autoindent = true;
        autoread = true;
        smartindent = true;
        breakindent = true;
        incsearch = true;
        hlsearch = true;
        signcolumn = "yes";
        scrolloff = 8;
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

    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

  };
}
