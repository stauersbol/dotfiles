return {
  {
    enabled = false,
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "v2.8.0",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    keys = {
      {
        "<leader>ccT",
        "<cmd>CopilotChatToggle<cr>",
        desc = "CopilotChat - Toggle", -- Toggle vertical split
      },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
      {
        "<leader>ccR",
        "<cmd>CopilotChatReview<cr>",
        desc = "CopilotChat - Review code",
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
