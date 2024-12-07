{ ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g base-index 1 

      bind r source-file ~/.config/tmux/tmux.conf

      bind-key -r f run-shell "tmux neww ~/.scripts/sessionizer.sh"
      bind-key -r i run-shell "tmux neww ~/.scripts/cht.sh"

      bind-key -r H run-shell "~/.scripts/sessionizer.sh ~/.config/home-manager"
    '';
  };
}
