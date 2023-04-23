require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = { height = 0.65, width = 0.6 },
		},
	},
	fzf = {
		fuzzy = true, -- false will only do exact matching
		override_generic_sorter = true, -- override the generic sorter
		override_file_sorter = true, -- override the file sorter
		case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		-- the default case_mode is "smart_case"
	},
})

require("telescope").load_extension("changes")
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol)

vim.keymap.set("n", "<leader>pr", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
