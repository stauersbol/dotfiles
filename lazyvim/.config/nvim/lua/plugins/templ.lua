return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {},
      },
    },
  },
  -- {
  --   "williamboman/mason.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     if type(opts.ensure_installed) == "table" then
  --       vim.list_extend(opts.ensure_installed, { "rnix-lsp" })
  --     end
  --   end,
  -- },
}
