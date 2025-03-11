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
    },
  },
}
