{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
      };
    };

    globals = {
      mapleader = " ";
    };

    opts = {
      clipboard = "unnamedplus";
      number = true;
      relativenumber = true;
    };

    plugins = {
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
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
          ];
        };
      };
      conform-nvim = {
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
                "prettierd"
                "prettier"
              ]
            ];
            css = [
              [
                "prettierd"
                "prettier"
              ]
            ];
            javascript = [
              [
                "prettierd"
                "prettier"
              ]
            ];
            javascriptreact = [
              [
                "prettierd"
                "prettier"
              ]
            ];
            typescript = [
              [
                "prettierd"
                "prettier"
              ]
            ];
            typescriptreact = [
              [
                "prettierd"
                "prettier"
              ]
            ];
            nix = [ "nixfmt" ];
            rust = [ "rustfmt" ];
          };
        };
      };
      harpoon = {
        enable = true;
      };
      lint = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          nil-ls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          ts-ls.enable = true;
        };
      };
      nvim-autopairs = {
        enable = true;
        settings = {
          disable_filetype = [
            "TelescopePrompt"
            "vim"
          ];
        };
      };
      telescope = {
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
      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
        };

        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };
      ts-autotag = {
        enable = true;
      };
      undotree = {
        enable = true;
      };
    };
  };
}
