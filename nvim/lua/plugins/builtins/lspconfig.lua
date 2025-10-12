return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- dartls = {
      --   mason = false,
      -- },
      lua_ls = {
        mason = false,
      },
      gdscript = {
        mason = false,
      },
      gopls = {
        mason = false,
      },
      ruff = {},
      qmlls = {
        mason = false,
      },
    },
    setups = {
      -- dartls = function()
      --   require("lspconfig").dartls.setup({
      --     init_options = {
      --       closingLabels = true,
      --       flutterOutline = true,
      --       onlyAnalyzeProjectsWithOpenFiles = true,
      --       outline = true,
      --       suggestFromUnimportedLibraries = true,
      --     },
      --   })
      -- end,
      gdscript = function()
        require("lspconfig").gdscript.setup({
          name = "Godot",
          filetypes = { "gd", "gdscript", "gdscript3" },
          cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
          root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
          on_attach = function(client, bufnr)
            vim.api.nvim_command('echo serverstart("' .. "/tmp/godot.pipe" .. '")')
          end,
        })
      end,
      qmlls = function()
        require("lspconfig").qmlls.setup({
          cmd = { "qmlls", "-E" },
        })
      end,
    },
  },
}
