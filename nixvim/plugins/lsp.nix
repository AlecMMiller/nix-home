{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    keymaps = {
      lspBuf = {
        gd = {
          action = "definition";
        };
      };
    };
    servers = {
      nil_ls.enable = true;
      ts_ls.enable = true;
    };
  };
}
