local tabbar = require('bufferline')

tabbar.setup({
    options = {
        diagnostics = "coc",
        diagnostics_update_in_insert = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "Nvim Tree",
                text_align = "center",
                separator = true
            }
        },
        color_icons = true,
        separator_style = "thin",
        hover = {
            enabled = true,
            delay = 50,
            reveal = { 'close' }
        },
    }
})

vim.keymap.set('n', '<leader>bd', vim.cmd.bd)
vim.keymap.set('n', '<leader>bn', vim.cmd.bnext)
vim.keymap.set('n', '<leader>bp', vim.cmd.bprevious)
