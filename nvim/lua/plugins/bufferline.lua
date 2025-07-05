---@diagnostic disable: missing-fields
-- This contains all the specs to load the bufferline plugin

return {
  {
    "akinsho/bufferline.nvim",
    priority = 1100,
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local bufferline = require("bufferline")
      local icons = require("lazyvim.config").icons.diagnostics
      bufferline.setup({
        options = {
          mode = "buffers",
          themable = false,
          indicator = { style = "none" },
          numbers = function(opts)
            return string.format("%s·", opts.ordinal)
          end,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, _, diag)
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
              .. (diag.hint and icons.Hint .. diag.hint or "")
              .. (diag.info and icons.Info .. diag.info or "")
            return vim.trim(ret)
          end,
          tab_size = 20,
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-Tree",
              highlight = "Directory",
              text_align = "center",
              separator = true,
            },
          },
          color_icons = false,
          separator_style = "thin",
          hover = {
            enabled = true,
            delay = 1,
            reveal = { "close" },
          },
          show_tab_indicators = false,
          close_command = function(bufnum)
            require("snacks").bufdelete.delete(bufnum)
          end,
        },
      })
    end,
  },
}
