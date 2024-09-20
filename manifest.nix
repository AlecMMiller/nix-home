{ lib, ... }:
with lib;
{
  options.bundles = {
    desktop = mkOption {
      type = types.bool;
      default = false;
    };

    gaming = mkOption {
      type = types.bool;
      default = false;
    };
  };

  imports = [
    ./common.nix
    ./direnv.nix
    ./eza.nix
    ./fcitx5.nix
    ./firefox.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./gtk.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./kitty.nix
    ./mako.nix
    ./nixvim
    ./ripgrep.nix
    ./starship.nix
    ./tmux.nix
    ./tofi.nix
    ./waybar.nix
  ];
}
