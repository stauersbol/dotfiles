return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "angular" })
      end
    end,
  },
}
