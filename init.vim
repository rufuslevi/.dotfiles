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

augroup insertMatch
    au!
    au BufReadPost * NoMatchParen
    au InsertEnter * NoMatchParen
    au InsertLeave * DoMatchParen
augroup END

if has('nvim') && exists('&winblend') && has('termguicolors')
  set winblend=10

  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif
endif

lua require('set')

 " Editor variables "
set termguicolors
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
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'LinArcX/telescope-changes.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-fugitive'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'karb94/neoscroll.nvim'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
Plug 'SmiteshP/nvim-navic'
call plug#end()

 " lua plugins to load on startup "
lua require('dark-mode')
lua require('tree')

if exists("g:neovide")
" g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
" let g:neovide_transparency = 0.0
" let g:transparency = 0.01
" let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
" let g:neovide_floating_blur_amount_x = 8.0
" let g:neovide_floating_blur_amount_y = 8.0
endif

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
