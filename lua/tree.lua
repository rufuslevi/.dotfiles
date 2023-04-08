local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
    require("nvim-tree.api").tree.toggle_hidden_filter()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
