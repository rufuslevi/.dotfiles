-- This is where the keymaps to move in the ui are to be put
local bufferDeleter = require("bufdelete")
local symbolsOutline = require("symbols-outline")
-- local signature = require("lsp_signature")

vim.keymap.set("n", "<leader>bd", bufferDeleter.bufdelete, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", vim.cmd.bprevious, { desc = "Buffer before" })
vim.keymap.set("n", "<leader>co", symbolsOutline.toggle_outline, { desc = "Open code outline" })
-- vim.keymap.set("n", "<leader>ch", signature.toggle_float_win, { desc = "Lsp signature" })
