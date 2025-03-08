-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local insertMatchGroup = vim.api.nvim_create_augroup("insertMatch", {})

vim.api.nvim_create_autocmd({ "BufReadPost", "InsertEnter" }, {
  pattern = "*",
  callback = function()
    vim.g.loaded_matchparen = 1
  end,
  group = insertMatchGroup,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    vim.g.loaded_matchparen = 0
  end,
  group = insertMatchGroup,
})
