-- This is where the keymaps for telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>mp", function()
  builtin.man_pages({ sections = { "ALL" } })
end, { desc = "[M]an [P]ages" })

vim.keymap.set("n", "<leader>pr", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
