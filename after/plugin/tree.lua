local tree = require("nvim-tree")
local api = require("nvim-tree.api")

tree.setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    sort_by = "case_sensitive",
    git = {
        ignore = false,
    },
    view = {
        side = "left",
        width = 30,
    },
    renderer = {
        group_empty = true,
    }
})

vim.keymap.set('n', '<leader>tt', api.tree.toggle)
