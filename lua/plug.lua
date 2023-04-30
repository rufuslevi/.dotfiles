local Plug = vim.fn["plug#"]

-- " Init different plugins "
vim.call("plug#begin", "~/.config/nvim/plugged")

Plug("xiyaowong/transparent.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("stevearc/dressing.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-lua/plenary.nvim")
Plug("ThePrimeagen/harpoon")
Plug("tpope/vim-fugitive")
Plug("nvim-tree/nvim-tree.lua")
Plug("akinsho/bufferline.nvim", { tag = "v3.*" })
Plug("nvim-lualine/lualine.nvim")
Plug("windwp/nvim-autopairs")
Plug("karb94/neoscroll.nvim")
Plug("folke/todo-comments.nvim")
Plug("famiu/bufdelete.nvim")
Plug("andweeb/presence.nvim")

--" Themes
Plug("f-person/auto-dark-mode.nvim")
Plug("gummesson/stereokai.vim")
Plug("sainnhe/sonokai")
Plug("kajamite/vim-monokai2")
Plug("catppuccin/nvim", { as = "catppuccin" })

--" Telescope
Plug("nvim-telescope/telescope.nvim")
Plug("LinArcX/telescope-changes.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", {
    ["do"] = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
})

--" Treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn[":TSUpdate"] })
Plug("nvim-treesitter/nvim-treesitter-context")

--" LSP Support
Plug("VonHeikemen/lsp-zero.nvim", { branch = "v2.x" })
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim", { ["do"] = vim.fn[":MasonUpdate"] })
Plug("williamboman/mason-lspconfig.nvim")
Plug("jubnzv/virtual-types.nvim")
Plug("Fildo7525/pretty_hover")
Plug("simrat39/inlay-hints.nvim")
Plug("simrat39/rust-tools.nvim")

--" Linter
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("jay-babu/mason-null-ls.nvim")

--" Comments
Plug("numToStr/Comment.nvim")
Plug("JoosepAlviste/nvim-ts-context-commentstring")

--" Autocompletion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("L3MON4D3/LuaSnip")
Plug("folke/neodev.nvim")
Plug("SmiteshP/nvim-navic")

vim.call("plug#end")
