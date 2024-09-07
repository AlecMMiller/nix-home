{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraConfig = ''
      let mapleader = ' '
      set number relativenumber
      hi Normal ctermbg=None
      hi Normal guibg=None
      '';

    plugins = with pkgs.vimPlugins; [
      rust-vim
      telescope-file-browser-nvim
      {
        plugin = undotree;
        type = "lua";
        config = ''
          vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        '';
      }
      {
        plugin = harpoon;
        type = "lua";
        config = ''
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
        config = ''
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
        config = ''
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
        '';
      }
      {
        plugin = lsp-zero-nvim;
        type = "lua";
        config = ''
          local lsp = require('lsp-zero')
          lsp.preset = ('recommended')
          lsp.setup()
        '';
      }
    ];

  };
}
