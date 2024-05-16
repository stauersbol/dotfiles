return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {},
        angularls = {},
        bashls = {},
        cssls = {},
        stylelint_lsp = {},
        dockerls = {},
        docker_compose_language_service = {},
        gleam = {},
        nixd = {},
        prismals = {},
        svelte = {},
        templ = {},
        unocss = {},
        v_analyzer = {},
        volar = {},
        zls = {},
        crystalline = {},
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
          "angular",
          "astro",
          "bash",
          "gleam",
          "javascript",
          "jsdoc",
          "nix",
          "prisma",
          "ssh_config",
          "svelte",
          "templ",
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
        vim.list_extend(opts.ensure_installed, { "stylelint", "rnix-lsp" })
      end
    end,
  },
}
