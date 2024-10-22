{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      lspBuf = {
        gd = {
          action = "definition";
        };
        gi = {
          action = "implementation";
        };
        gr = {
          action = "references";
        };
        "<leader>rn" = {
          action = "rename";
        };
        K = {
          action = "hover";
        };
        "<leader>ca" = {
          action = "code_action";
        };
      };
    };
    servers = {
      nil_ls.enable = true;
      ts_ls.enable = true;
    };
  };
}
