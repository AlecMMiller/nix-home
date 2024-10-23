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
    cmp_luasnip = {
      enable = true;
    };
    fidget = {
      enable = true;
    };
    friendly-snippets = {
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
    lsp-signature = {
      enable = true;
    };
    luasnip = {
      enable = true;
      fromVscode = [
        { }
      ];
    };
    navic = {
      enable = true;
    };
    neogit = {
      enable = true;
    };
    neotest = {
      enable = true;
      adapters = {
        jest.enable = true;
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
    oil = {
      enable = true;
    };
    rustaceanvim = {
      enable = true;
    };
    ts-autotag = {
      enable = true;
    };
    typst-vim = {
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
