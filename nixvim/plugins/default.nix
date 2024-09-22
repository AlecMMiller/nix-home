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
    ts-autotag = {
      enable = true;
    };
    undotree = {
      enable = true;
    };
  };

}
