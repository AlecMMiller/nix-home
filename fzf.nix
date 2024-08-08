{ ... }:

{
  programs.fzf = {
    enable = true;
    fileWidgetOptions = [
      "--preview 'bat -n --color=always --line-range :500 {}'"
    ];
    changeDirWidgetOptions = [
      "--preview 'eza --tree --color=always {} | head -200'"
    ];
  };
}
