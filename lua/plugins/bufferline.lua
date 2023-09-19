---@diagnostic disable: missing-fields
-- This contains all the specs to load the bufferline plugin

return {
  {
    "famiu/bufdelete.nvim",
  },
  {
    "akinsho/bufferline.nvim",
    priority = 1100,
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "famiu/bufdelete.nvim",
    },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = true,
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-Tree",
              highlight = "Directory",
              text_align = "center",
              separator = true,
            },
          },
          color_icons = true,
          separator_style = "thin",
          hover = {
            enabled = true,
            delay = 10,
            reveal = { "close" },
          },
          close_command = function(bufnum)
            require("bufdelete").bufdelete(bufnum, true)
          end,
        },
      })
    end,
  },
}
