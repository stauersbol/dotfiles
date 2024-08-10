return {
  "olexsmir/gopher.nvim",
  ft = "go",
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
  keys = {
    {
      "<leader>cgj",
      "<cmd>GoTagAdd json<cr>",
      desc = "Add json tags to Go struct",
    },
  },
}
