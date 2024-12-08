{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "nix-re" = "sudo nixos-rebuild switch";
      "home-re" = "home-manager switch --impure";
      ls = "eza";
      cat = "bat";
      open = "xdg-open";
    };
    interactiveShellInit = ''
      fish_vi_key_bindings
      set fish_greeting
    '';
  };
}
