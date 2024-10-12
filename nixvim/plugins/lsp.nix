{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil-ls.enable = true;
      ts-ls.enable = true;
    };
  };
}
