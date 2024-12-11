{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  sources = import ./npins;
  username = "alec";
in
{
  imports = [
    (sources.catppuccin + "/modules/home-manager")
    inputs.nixvim.homeManagerModules.nixvim
  ];

  config = {
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];
    };

    home.username = username;
    home.homeDirectory = "/home/" + username;
    targets.genericLinux.enable = true;
    services.kdeconnect.enable = config.bundles.gui;

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages =
      with pkgs;
      [
        btop
        nixd
        vscode-langservers-extracted
        nixfmt-rfc-style
        prettierd
        rustfmt
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        fira-code
        fira-code-symbols
        nerd-fonts.fira-code
        fd
      ]
      ++ lib.optionals config.bundles.gui [
        usbutils
        grim
        bitwarden-desktop
        keepassxc
        slurp
        wl-clipboard
        pavucontrol
        google-chrome
        spotify
        discord
        vscode
        playerctl
        (blender.override {
          cudaSupport = config.bundles.desktop;
        })
      ]
      ++ lib.optionals config.bundles.desktop [
        davinci-resolve
        prismlauncher
        fspy
        jdk8
        virt-manager
        ollama
      ];

    home.sessionVariables = {
      TSS2_LOG = "fapi+NONE";
    };

    programs.fd.enable = config.bundles.gui;
    programs.k9s.enable = true;

    programs.bat = {
      enable = true;
    };

    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    fonts = {
      fontconfig.enable = true;
    };

    xdg.enable = config.bundles.gui;

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

    home.file.".scripts/cht.sh" = {
      source = ./scripts/cht.sh;
    };

    home.file.".scripts/sessionizer.sh" = {
      executable = true;
      source = ./scripts/sessionizer.sh;
    };

    home.file.".scripts/windowizer.sh" = {
      executable = true;
      source = ./scripts/windowizer.sh;
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    programs.home-manager.path = pkgs.lib.mkForce "$HOME/home-manager";
  };
}
