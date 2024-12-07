{ ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g base-index 1
      set -g renumber-windows on 

      bind r source-file ~/.config/tmux/tmux.conf

      bind-key -r f run-shell "tmux neww ~/.scripts/sessionizer.sh"
      bind-key -r i run-shell "tmux neww ~/.scripts/cht.sh"

      bind-key -r H run-shell "~/.scripts/sessionizer.sh ~/.config/home-manager"

      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'

      set -g status-position top
    '';

    catppuccin = {
      enable = true;
      extraConfig = ''
        set -g @catppuccin_window_right_separator "█"
        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_number_position "left"
        set -g @catppuccin_window_middle_separator " "
        set -g @catppuccin_window_default_text "#W"
        set -g @catppuccin_window_default_fill "none"
        set -g @catppuccin_window_current_fill "all"
        set -g @catppuccin_window_current_text "#W"
        set -g @catppuccin_status_modules_right "session date_time"
        set -g @catppuccin_status_left_separator "█"
        set -g @catppuccin_status_right_separator "█"
        set -g @catppuccin_status_right_separator_inverse "no"
        set -g @catppuccin_status_fill "all"
        set -g @catppuccin_status_connect_separator "no"
        set -g @catppuccin_directory_text "#{pane_current_path}"
        set -g @catppuccin_date_time_text "%H:%M"
      '';
    };
  };
}
