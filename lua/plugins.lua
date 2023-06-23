local function tableMerge(result, ...)
	for _, t in ipairs({ ... }) do
		for _, v in ipairs(t) do
			table.insert(result, v)
		end
	end
end

local plugins = {
	-- Generic Plugins
	"xiyaowong/transparent.nvim",
	"nvim-lualine/lualine.nvim",
	"andweeb/presence.nvim",
	"tpope/vim-fugitive",
	"famiu/bufdelete.nvim",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- LSP Plugins
	"simrat39/inlay-hints.nvim",
	"simrat39/rust-tools.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
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
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},

	-- Linting Plugins
	"MunifTanjim/prettier.nvim",

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
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	-- Treesitter Plugins
	"nvim-treesitter/nvim-treesitter-context",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- UI Plugins
	"nvim-tree/nvim-web-devicons",
	"karb94/neoscroll.nvim",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"ray-x/guihua.lua",
		run = "cd lua/fzy && make",
	},

	-- Themes Plugins
	"dylanaraps/wal.vim",
	"f-person/auto-dark-mode.nvim",
	"gummesson/stereokai.vim",
	"sainnhe/sonokai",
	"kajamite/vim-monokai2",
	"ishan9299/nvim-solarized-lua",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
}

return plugins
