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
      local bufferline = require("bufferline")
      local icons = require("lazyvim.config").icons.diagnostics
      bufferline.setup({
        options = {
          mode = "buffers",
          themable = true,
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
          color_icons = true,
          separator_style = "thin",
          hover = {
            enabled = true,
            delay = 2,
            reveal = { "close" },
          },
          close_command = function(bufnum)
            require("bufdelete").bufdelete(bufnum, true)
          end,
          show_tab_indicators = false,
          custom_areas = {
            left = function()
              local result = {}
              local seve = vim.diagnostic.severity
              local error = #vim.diagnostic.get(nil, { severity = seve.ERROR })
              local warning = #vim.diagnostic.get(nil, { severity = seve.WARN })
              local info = #vim.diagnostic.get(nil, { severity = seve.INFO })
              local hint = #vim.diagnostic.get(nil, { severity = seve.HINT })

              if error ~= 0 then
                table.insert(result, { text = icons.Error .. error, fg = "#EC5241" })
              end

              if warning ~= 0 then
                table.insert(result, { text = icons.Warn .. warning, fg = "#EFB839" })
              end

              if hint ~= 0 then
                table.insert(result, { text = icons.Hint .. hint, fg = "#A3BA5E" })
              end

              if info ~= 0 then
                table.insert(result, { text = icons.Info .. info, fg = "#7EA9A7" })
              end

              if next(result) ~= nil then
                table.insert(result, { text = " > " })
              end

              return result
            end,
          },
        },
      })
    end,
  },
}
