{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "nix-re"="sudo nixos-rebuild switch --flake /etc/nixos#default";
      "home-re"="home-manager switch --impure";
      ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
