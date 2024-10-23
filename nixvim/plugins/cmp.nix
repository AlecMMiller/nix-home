{ ... }:

{
  programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      autoEnableSources = true;
      mapping = {
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
      sources = [
        { name = "git"; }
        { name = "nvim_lsp"; }
        {
          name = "buffer";
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          keywordLength = 3;
        }
        {
          name = "path";
          keywordLength = 3;
        }
        {
          name = "luasnip";
          keywordLength = 3;
        }
        {
          name = "cmp_luasnip";
        }
      ];
      snippet.expand = # lua
        ''
          function(args)
            require("luasnip").lsp_expand(args.body)
          end
        '';
      view = {
        docs = {
          auto_open = true;
        };
      };
      experimental = {
        ghost_text = true;
      };
    };
  };
}
