-- This contains all the specs to load the Neo-Tree

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
        remap = true,
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
        remap = true,
      },
    },
    opts = {
      source_selector = {
        winbar = true,
        statusline = true,
        sources = {
          { source = "filesystem" },
          -- { source = "buffers" },
          { source = "git_status" },
          { source = "document_symbols" },
        },
        content_layout = "center",
        tabs_layout = "equal",
      },
    },
  },
}
