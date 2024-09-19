{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraConfig = /* lua */''
      let mapleader = ' '
      set number relativenumber
      set clipboard+=unnamedplus
      hi Normal ctermbg=None
      hi Normal guibg=None
      '';

    plugins = with pkgs.vimPlugins; [
      rust-vim
      telescope-file-browser-nvim
      cmp-nvim-lsp
      {
        plugin = undotree;
        type = "lua";
        config = /* lua */''
          vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        '';
      }
      {
        plugin = harpoon;
        type = "lua";
        config = /* lua */''
          local mark = require('harpoon.mark')
          local ui = require('harpoon.ui')
          vim.keymap.set('n', '<leader>a', mark.add_file)
          vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
          vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
          vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
        '';
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = /* lua */''
          require'nvim-treesitter.configs'.setup {
            highlight = {
              enable = true,
            },
          }
        '';
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = /* lua */''
          local builtin = require('telescope.builtin')
          
          local telescope = require('telescope')

          telescope.setup {
            defaults = {
              file_ignore_patterns = {
                "node_modules",
                "target"
              }
            }
          }
          vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
          vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
          vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
          vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
        '';
      }
      {
        plugin = lsp-zero-nvim;
        type = "lua";
        config = /* lua */''
          local lsp_zero = require('lsp-zero')

          local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
          end

          lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          })
        '';
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = /* lua */''
          local cmp = require('cmp')

          local cmp_select = { behavior = cmp.SelectBehavior.Select }
          cmp.setup({
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
            }, {
              { name = 'buffer' },
            })
          })
        '';
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = /* lua */''
          require'lspconfig'.nixd.setup{}
          require'lspconfig'.lua_ls.setup{}
          require'lspconfig'.vtsls.setup{}
        '';
      }
    ];
  };
}
