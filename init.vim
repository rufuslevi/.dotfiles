 " Setting different "
set clipboard=unnamed " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
" set cursorline " Highlights the current line in the editor
" set hidden " Hide unused buffers
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80,120 " Show at 80 column a border for good code style
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ttyfast " Speed up scrolling in Vim
set number 
set relativenumber
set nospell
set autoindent " Indent a new line
syntax on
filetype plugin indent on   " Allow auto-indenting depending on file type

 " Editor variables "
if has('termguicolors')
    set termguicolors
endif
let mapleader=" "
let g:sonokai_better_performance = 1
let g:sonokai_style = 'maia'

 " Init different plugins "
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'f-person/auto-dark-mode.nvim'
Plug 'gummesson/stereokai.vim'
Plug 'sainnhe/sonokai'
Plug 'kajamite/vim-monokai2'
Plug 'xiyaowong/transparent.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-fugitive'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'jiangmiao/auto-pairs'

" LSP Support
Plug 'neovim/nvim-lspconfig'                           
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'    

" Comments
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required
Plug 'folke/neodev.nvim'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
Plug 'SmiteshP/nvim-navic'
call plug#end()

 " lua plugins to load on startup "
lua require('dark-mode')
lua require('tree')
