{ pkgs, lib, config, ... }:
let
sources = import ./npins;
in
{
  imports = [
    (sources.catppuccin + "/modules/home-manager")
  ];


  config = {
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

    home.username = "alec";
    home.homeDirectory = "/home/alec";
    targets.genericLinux.enable = true;
# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

      home.pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 16;
      };

# The home.packages option allows you to install Nix packages into your
# environment.
    home.packages = with pkgs; 
    [
      nixd
        vscode-langservers-extracted
        usbutils
        spotify
        discord
        blender
        pavucontrol
        playerctl
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        fira-code
        fira-code-symbols
        grim
        slurp
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ] ++ lib.optionals config.bundles.desktop [ 
    davinci-resolve
    prismlauncher
    jdk8
    virt-manager
    ];

    fonts.fontconfig.enable = true;

    xdg.enable = true;

#home-manager.enable = true;
    catppuccin.flavor = "mocha";
    catppuccin.enable = true;

    editorconfig = {
      enable = true;

      settings = {
        "*" = {
          charset = "utf-8";
          end_of_line = "lf";
          insert_final_newline = true;
          indent_size = 2;
          indent_style = "space";
          trim_trailing_whitespace = false;
        };
      };
    };

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
