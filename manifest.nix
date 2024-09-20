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
    ./de
    ./eza.nix
    ./fcitx5.nix
    ./firefox.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./gtk.nix
    ./kitty.nix
    ./mako.nix
    ./nixvim
    ./ripgrep.nix
    ./starship.nix
    ./tmux.nix
  ];
}
