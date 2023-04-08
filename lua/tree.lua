local function open_nvim_tree()
    local api = require("nvim-tree.api")

    api.tree.open()
    api.tree.toggle_hidden_filter()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
