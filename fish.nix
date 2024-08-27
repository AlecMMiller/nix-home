{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "nix-re"="sudo nixos-rebuild switch";
      "home-re"="home-manager switch --impure";
      ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
