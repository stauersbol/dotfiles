return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "v" })
      end
    end,
  },
}
