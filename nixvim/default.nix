{ ... }:
{
  imports = [ ./plugins ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        #transparent_background = true;
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

    keymaps = [
      {
        action = "<cmd>Neotest run<CR>";
        key = "<leader>tr";
        mode = "n";
        options = {
          desc = "Run nearest test";
        };
      }
      {
        action = "<cmd>Neotest summary<CR>";
        key = "<leader>ts";
        mode = "n";
        options = {
          desc = "Show test summary";
        };
      }
      {
        key = "<leader>tf";
        action.__raw = ''function() require("neotest").run.run(vim.fn.expand("%")) end'';
        options = {
          desc = "Run file";
        };
      }
      {
        key = "<leader>ta";
        action.__raw = ''function() require("neotest").run.run(vim.uv.cwd()) end'';
        options = {
          desc = "Run all files";
        };
      }
    ];

  };
}
