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

local luasnip_fix_augroup = vim.api.nvim_create_augroup("MyLuaSnipHistory", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
  group = luasnip_fix_augroup,
})
