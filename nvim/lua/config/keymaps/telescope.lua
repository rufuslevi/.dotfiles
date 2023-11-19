-- This is where the keymaps for telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Files find" })
vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Git files find" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Buffer find" })
vim.keymap.set("n", "<leader>pc", builtin.current_buffer_fuzzy_find, { desc = "Current buffer find" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol, { desc = "Code symbol" })
vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Code error" })

vim.keymap.set("n", "<leader>mp", function()
  builtin.man_pages({ sections = { "ALL" } })
end, { desc = "[M]an [P]ages" })

vim.keymap.set("n", "<leader>pr", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
