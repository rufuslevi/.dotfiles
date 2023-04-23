 " Setting different "
set clipboard=unnamed " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
" set cursorline " Highlights the current line in the editor
" set hidden " Hide unused buffers
set inccommand=split " Show replacements in a split screen

set mouse=a " Allow to use the mouse in the editor
set mousemoveevent

set splitbelow splitright " Change the split screen behavior
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
set nowrap
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number 
set relativenumber

set nospell
set autoindent " Indent a new line
syntax on
filetype plugin indent on   " Allow auto-indenting depending on file type

" Fix for the Enter key with pairs and lsp completion
augroup insertMatch
    au!
    au BufReadPost * NoMatchParen
    au InsertEnter * NoMatchParen
    au InsertLeave * DoMatchParen
augroup END

lua require('set')

 " Editor variables "
set termguicolors
let mapleader=" "
let g:sonokai_better_performance = 1
let g:sonokai_style = 'maia'
let g:nvim_tree_auto_close=1

 " Init different plugins "
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'xiyaowong/transparent.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-fugitive'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'karb94/neoscroll.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'famiu/bufdelete.nvim'

" Themes
Plug 'f-person/auto-dark-mode.nvim'
Plug 'gummesson/stereokai.vim'
Plug 'sainnhe/sonokai'
Plug 'kajamite/vim-monokai2'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'LinArcX/telescope-changes.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" LSP Support
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
Plug 'neovim/nvim-lspconfig'                           
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'  
Plug 'jubnzv/virtual-types.nvim'
Plug 'Fildo7525/pretty_hover'
Plug 'simrat39/inlay-hints.nvim'
Plug 'simrat39/rust-tools.nvim'

" Linter
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'

" Comments
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required
Plug 'folke/neodev.nvim'

Plug 'SmiteshP/nvim-navic'
call plug#end()

 " lua plugins to load on startup "
lua require('dark-mode')
lua require('tree')
lua require('status_bar')

