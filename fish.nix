{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "nix-re"="sudo nixos-rebuild switch --flake /etc/nixos#default";
      "home-re"="home-manager switch --impure";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
