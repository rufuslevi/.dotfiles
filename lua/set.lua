-- Consistency settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.clipboard = "unnamed"
vim.opt.completeopt = "noinsert,menuone,noselect"
vim.opt.inccommand = "split"

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Position settings
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes:1"
vim.opt.isfname:append("@-@")

-- Tab behaviors
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse settings
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

-- Behaviors settings
vim.opt.updatetime = 50
vim.opt.spell = false
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.smartindent = true

-- UI settings
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.cc = "80"
vim.opt.syntax = "ON"
vim.opt.termguicolors = true
vim.g.mapleader = " "

-- Theme settings
vim.g.sonokai_better_performance = 1
vim.g.sonokai_style = "maia"
vim.g.nvim_tree_auto_close = 1

local insertMatchGroup = vim.api.nvim_create_augroup("insertMatch", {})
vim.api.nvim_create_autocmd({ "BufReadPost", "InsertEnter" }, {
    pattern = "*",
    callback = function()
        vim.g.loaded_matchparen = 1
    end,
    group = insertMatchGroup,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = function()
        vim.g.loaded_matchparen = 0
    end,
    group = insertMatchGroup,
})
