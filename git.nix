{ ... }:

{
  programs.git = {
    enable = true;
    userEmail = "alecmichaelmiller@gmail.com";
    userName = "Alec Miller";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = false;
      };
    };
    signing = {
      key = "alecmichaelmiller@gmail.com";
      signByDefault = true;
    };
  };
}
