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

lsp_config.lua_ls.setup({
    on_attach = function(client, bufnr)
        ih.on_attach(client, bufnr)
    end,
    settings = {
        Lua = {
            hint = {
                enable = true,
            },
            workspace = {
                checkThirdParty = false,
            },
        },
    },
})

-- lsp_config.sumneko_lua.setup({
--     settings = {
--         Lua = {
--             workspace = {
--                 checkThirdParty = false,
--             },
--         },
--     },
-- })
--

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

Icons = {
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
local lspkind = require('lspkind')
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = 'nerdfont' },
    }),
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

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
