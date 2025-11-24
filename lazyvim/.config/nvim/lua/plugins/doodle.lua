return {
  "apdot/doodle",
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("doodle").setup({
      settings = {
        -- This is the only required setting for sync to work.
        -- Set it to the absolute path of your private notes repository.
        git_repo = vim.fn.expand("~/Projects/personal/notes"),
        sync = true,
      },
    })
  end,
  keys = {
    {
      "<space>a",
      "",
      desc = "notes",
    },
    {
      "<space>af",
      function()
        require("doodle"):toggle_finder()
      end,
      desc = "Doodle Finder",
    },
    {
      "<space>as",
      function()
        require("doodle"):sync()
      end,
      desc = "Doodle Sync",
    },
    {
      "<space>al",
      function()
        require("doodle"):toggle_links()
      end,
      desc = "Doodle Links",
    },
  },
}
