return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        cssls = {},
        stylelint_lsp = {},
        dockerls = {},
        docker_compose_language_service = {},
        unocss = {},
        v_analyzer = {},
        volar = {},
        zls = {},
        crystalline = {},
        hyprls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "dockerfile",
          "yaml",
          "bash",
          "javascript",
          "jsdoc",
          "ssh_config",
          "v",
          "vue",
          "zig",
        })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "stylelint" })
      end
    end,
  },
  {
    "ndonfris/fish-lsp",
    config = function()
      vim.cmd([[
        autocmd BufWritePre,BufEnter *.fish lua vim.lsp.start({name='fish-lsp', cmd = {'fish-lsp', 'start'}, filetypes = {'fish'}})
        autocmd CursorHold  <silent><buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorHoldI <silent><buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <silent><buffer> lua vim.lsp.buf.clear_references()
      ]])
    end,
  },
}
