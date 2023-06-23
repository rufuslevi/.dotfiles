require("neodev").setup({})

local lsp = require("lsp-zero").preset({})
local lsp_config = require("lspconfig")
local ih = require("inlay-hints")
local virtual_types = require("virtualtypes")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	lsp.buffer_autoformat()
	virtual_types.on_attach()
end)

lsp.preset("recommended")

lsp.ensure_installed({
	"angularls",
	"eslint",
	"html",
	"jsonls",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tsserver",
})

lsp.format_on_save({
	servers = {
		-- ["lua_ls"] = { "lua" },
		["rust_analyzer"] = { "rust" },
		["tsserver"] = { "ts" },
	},
})

-- lsp_config.lua_ls.setup({
--     on_attach = function(client, bufnr)
--         ih.on_attach(client, bufnr)
--     end,
--     settings = {
--         Lua = {
--             hint = {
--                 enable = true,
--             },
--             workspace = {
--                 checkThirdParty = false,
--             },
--         },
--     },
-- })

-- lsp_config.sumneko_lua.setup({
--     settings = {
--         Lua = {
--             workspace = {
--                 checkThirdParty = false,
--             },
--         },
--     },
-- })

lsp_config.tsserver.setup({
	on_attach = function(c, b)
		ih.on_attach(c, b)
	end,
	settings = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

icons = {
	Text = " ",
	Method = " ",
	Function = "󰊕 ",
	Constructor = " ",
	Field = " ",
	Variable = " ",
	Class = "󰠱 ",
	Interface = " ",
	Module = "󰏓 ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	EnumMember = " ",
	Keyword = "󰌋 ",
	Snippet = "󰲋 ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	Constant = "󰏿 ",
	Struct = "󰠱 ",
	Event = " ",
	Operator = " ",
	TypeParameter = "󰘦 ",
	Unknown = "  ",
}

-- Format the completion menu.
-- Yes, I am that pedantic.
local function format(_, item)
	-- Utils.
	local MAX_LABEL_WIDTH = 50
	local function whitespace(max, len)
		return (" "):rep(max - len)
	end

	-- Limit content width.
	local content = item.abbr
	if #content > MAX_LABEL_WIDTH then
		item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. "…"
	else
		item.abbr = content .. whitespace(MAX_LABEL_WIDTH, #content)
	end

	-- Replace kind with icons.
	item.kind = " " .. (icons[item.kind] or icons.Unknown) .. "│"

	-- Remove gibberish.
	item.menu = nil

	return item
end

lsp.skip_server_setup({ "rust_analyzer", "pylsp", "jedi_language_server" })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
	formatting = {
		fields = { "kind", "abbr" },
		format = format,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	},
	mapping = {
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
			scrollbar = true,
			col_offset = -1,
			side_padding = 0,
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Pmenu,FloatBorder:PmenuDocBorder,CursorLine:PmenuSel,Search:None",
			scrollbar = true,
			side_padding = 1, -- Not working?
		}),
	},
})

lsp.setup()

local rust_tools = require("rust-tools")
rust_tools.setup({
	tools = {
		on_initialized = function()
			ih.set_all()
		end,
		inlay_hints = {
			auto = false,
		},
	},
	server = {
		on_attach = function(c, b)
			ih.on_attach(c, b)
		end,
	},
})

-- Null-ls configs for missing languages
local null_ls = require("null-ls")
-- local prettier = require("prettier")

null_ls.setup({
	border = nil,
	cmd = { "nvim" },
	debounce = 250,
	debug = false,
	default_timeout = 5000,
	diagnostic_config = {},
	diagnostics_format = "#{m}",
	fallback_severity = vim.diagnostic.severity.ERROR,
	log_level = "warn",
	notify_format = "[null-ls] %s",
	on_attach = nil,
	on_init = nil,
	on_exit = nil,
	root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
	should_attach = nil,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.ltrs,
		-- null_ls.builtins.completion.spell
		null_ls.builtins.formatting.prettier,
	},
	temp_dir = nil,
	update_in_insert = false,
})

-- prettier.setup({
-- 	["null-ls"] = {
-- 		condition = function()
-- 			return prettier.config_exists({
-- 				-- if `false`, skips checking `package.json` for `"prettier"` key
-- 				check_package_json = true,
-- 			})
-- 		end,
-- 		runtime_condition = function(params)
-- 			-- return false to skip running prettier
-- 			return true
-- 		end,
-- 		timeout = 5000,
-- 	},
-- })

require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
	automatic_setup = false,
})
