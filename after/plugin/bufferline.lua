local tabbar = require('bufferline')

tabbar.setup({
    options = {
        diagnostics = "coc",
        diagnostics_update_in_insert = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
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
