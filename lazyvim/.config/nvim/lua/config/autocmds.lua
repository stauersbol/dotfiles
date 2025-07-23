-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat in selected proejcts due to format rules
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    local disallowed_projects = {
      ["dws-server"] = true,
      ["dws-config"] = true,
    }

    if disallowed_projects[project_name] then
      vim.g.autoformat = false
    else
      vim.g.autoformat = true
    end
  end,
})
