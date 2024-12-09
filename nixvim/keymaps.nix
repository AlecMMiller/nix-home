{ ... }:
{
  programs.nixvim.keymaps = [
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
    {
      key = "<leader>dd";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
    }
    {
      key = "<leader>fw";
      action.__raw = ''function() require("telescope").extensions.git_worktree.git_worktrees() end'';
    }
    {
      key = "<leader>wa";
      action.__raw = ''function() require("telescope").extensions.git_worktree.create_git_worktree() end'';
    }
  ];
}
