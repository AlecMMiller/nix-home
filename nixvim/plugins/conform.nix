{ ... }:

{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      log_level = "debug";
      notify_on_error = true;
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      formatters_by_ft = {
        html = [
          [
            "prettier"
          ]
        ];
        css = [
          [
            "prettier"
          ]
        ];
        javascript = [
          [
            "prettier"
          ]
        ];
        javascriptreact = [
          [
            "prettier"
          ]
        ];
        typescript = [
          [
            "prettier"
          ]
        ];
        typescriptreact = [
          [
            "prettier"
          ]
        ];
        nix = [ "nixfmt" ];
        rust = [ "rustfmt" ];
      };
    };
  };
}
