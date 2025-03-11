return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      dartls = {
        mason = false,
      },
      lua_ls = {
        mason = false,
      },
      gdscript = {
        mason = false,
      },
      gopls = {
        mason = false,
      },
    },
    setups = {
      gdscript = function()
        require("lspconfig").gdscript.setup({
          cmd = {
            vim.lsp.rpc.connect("127.0.0.1", tonumber(os.getenv("GDScript_Port") or "6006")),
          },
        })
      end,
    },
  },
}
