{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
      };
      "<leader>fg" = {
        action = "live_grep";
      };
      "<leader>fs" = {
        action = "lsp_document_symbols";
      };
    };
    settings = {
      pickers = {
        find_files = {
          find_command = [
            "fd"
            "--hidden"
            "-E"
            ".git"
          ];
        };
      };
    };
  };
}
