{ ... }:

{
  programs.git = {
    enable = true;
    userEmail = "alecmichaelmiller@gmail.com";
    userName = "Alec Miller";
    extraConfig = {
      push = { autoSetupRemote = true; };
    };
  };
}
