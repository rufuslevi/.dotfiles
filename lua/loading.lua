local function tableMerge(result, ...)
    for _, t in ipairs({ ... }) do
        for _, v in ipairs(t) do
            table.insert(result, v)
        end
    end
end

local plugins = {
    -- Themes Plugins
    "gummesson/stereokai.vim",
    "sainnhe/sonokai",
    "ishan9299/nvim-solarized-lua",
    {
        'loctvl842/monokai-pro.nvim'
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("config.catppuccin")
        end,
    },
    {
        "rakr/vim-one",
        priority = 1000,
        lazy = false,
        enabled = false
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        lazy = false,
        enabled = false
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        lazy = false,
        enabled = false,
        config = function()
            require('onedark').setup {
                style = 'light',
                lualine = {
                    transparent = false, -- lualine center bar transparency
                },
            }
            require('onedark').load()
        end
    },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme ayu]])
        end
    },
    {
        "polirritmico/monokai-nightasty.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "f-person/auto-dark-mode.nvim",
        config = function()
            require("auto-dark-mode").setup({
                update_interval = 1000,
                set_dark_mode = function()
                    vim.api.nvim_set_option("background", "dark")
                    vim.cmd("colorscheme catppuccin-mocha")
                end,
                set_light_mode = function()
                    vim.api.nvim_set_option("background", "light")

                    -- Settings for solarized theme
                    -- vim.cmd("colorscheme solarized-high")
                    -- vim.g.solarized_diffmode = "high"
                    -- To enable transparency
                    -- vim.g.solarized_termtrans = 1

                    vim.cmd("colorscheme monokai-pro-octagon")
                    require("lualine").setup({ options = { theme = 'monokai-pro' } })
                    -- vim.cmd([[colorscheme ayu]])
                    -- vim.cmd("colorscheme catppuccin-latte")
                    -- vim.cmd("colorscheme one")
                    -- vim.cmd("colorscheme onelight")
                end,
            })
            require("auto-dark-mode").init()
        end,
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            require("config.lspkind")
        end
    },

    -- Generic Plugins
    "xiyaowong/transparent.nvim",
    {
        "andweeb/presence.nvim",
        config = function()
            require("config.presence")
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            require("config.fugitive")
        end,
    },
    "famiu/bufdelete.nvim",
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.lualine")
        end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "catppuccin" },
            { "Shatur/neovim-ayu" }
        },
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("config.comment")
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopair")
        end,
    },
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({})
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
        config = function()
            require("config.dresser")
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            require("config.undotree")
        end,
    },
    {
        "tpope/vim-sleuth"
    },

    -- LSP Plugins
    {
        "simrat39/inlay-hints.nvim",
        config = function()
            require("config.inlay-hints")
        end,
    },
    "simrat39/rust-tools.nvim",
    {
        "mhartington/formatter.nvim",
        config = function()
            require("config.formatter")
        end,
    },
    "jubnzv/virtual-types.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        },
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    },

    -- Linting Plugins
    {
        "MunifTanjim/prettier.nvim",
        config = function()
            require("config.prettier")
        end,
    },

    -- Autocompletion Plugins
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require("config.lsp")
        end,
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },

    -- Languages Plugins
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
    {
        "heavenshell/vim-jsdoc",
        ft = { "javascript", "javascript.jsx", "typescript" },
        build = "make install",
    },

    -- Telescope Plugins
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon",
    "LinArcX/telescope-changes.nvim",
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        config = function()
            require("config.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },

    -- Treesitter Plugins
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = {
            max_lines = 2,
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("config.treesitter")
        end,
    },

    -- UI Plugins
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("config.devicons")
        end,
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("config.scroll")
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.todo-comments")
        end,
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
        opts = {},
        config = function()
            require("config.pretty_hover")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        priority = 1100,
        lazy = false,
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("config.bufferline")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("config.tree")
        end,
    },
    {
        "ray-x/guihua.lua",
        run = "cd lua/fzy && make",
    },
}

return plugins
