{ ... }:

{
  imports = [
    ./cmp.nix
    ./conform.nix
    ./lsp.nix
    ./telescope.nix
    ./treesitter.nix
  ];
  programs.nixvim.plugins = {
    fidget = {
      enable = true;
    };
    harpoon = {
      enable = true;
      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<C-e>";
        navFile = {
          "1" = "<leader>hj";
          "2" = "<leader>hk";
          "3" = "<leader>hl";
          "4" = "<leader>hm";
        };
      };
    };
    illuminate = {
      enable = true;
    };
    indent-blankline = {
      enable = true;
    };
    lint = {
      enable = true;
    };
    luasnip = {
      enable = true;
    };
    navic = {
      enable = true;
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
    oil = {
      enable = true;
    };
    rustaceanvim = {
      enable = true;
    };
    ts-autotag = {
      enable = true;
    };
    undotree = {
      enable = true;
    };
    web-devicons = {
      enable = true;
    };
  };

}
