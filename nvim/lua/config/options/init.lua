-- This is the central point for all options that are to be loaded

require("config.options.themes")
require("config.options.ui")
require("config.options.lsp")

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
-- vim.opt.smartindent = true

-- Instant settings
vim.g.instant_username = "rufuslevi"
