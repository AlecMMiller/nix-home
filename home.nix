{ config, pkgs, lib, inputs, ... }:
let
  sources = import ./npins;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; 
  [
    usbutils
    spotify
    discord
    blender
    pavucontrol
    playerctl
    davinci-resolve
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    grim
    slurp
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  fonts.fontconfig.enable = true;

  xdg.enable = true;

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      alias nix-re='sudo nixos-rebuild switch --flake /etc/nixos#default'
      alias home-re='home-manager switch --impure'
    '';
  };

  imports = [
    (sources.catppuccin + "/modules/home-manager")
    ./waybar.nix
    ./hyprland.nix
    ./eza.nix
    ./hyprpaper.nix
    ./tofi.nix
    ./kitty.nix
    ./git.nix
    ./neovim.nix
    ./gtk.nix
    ./mako.nix
    ./bat.nix
    ./direnv.nix
    ./fcitx5.nix
    ./firefox.nix
    ./fish.nix
    ./fzf.nix
    ./starship.nix
    ./tmux.nix
  ];

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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/alec/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
