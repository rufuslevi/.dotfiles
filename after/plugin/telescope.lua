require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = { height = 0.65, width = 0.6 }
        },
    },
})

-- require('telescope').load_extension('ui-select')
require('telescope').load_extension('changes')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>cs', vim.lsp.buf.document_symbol)
vim.keymap.set('n', '<leader>ci', vim.lsp.buf.hover)

vim.keymap.set('n', '<leader>pr', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
