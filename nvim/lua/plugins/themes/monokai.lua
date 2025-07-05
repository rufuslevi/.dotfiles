return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_transparent_background = 0
      vim.g.sonokai_style = "default" -- "default", "atlantis", "andromeda", "shusia", "maia", "espresso"
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = false,
      terminal_colors = true,
      devicons = true,
      styles = {
        comment = { italic = true },
        keyword = { italic = false }, -- any other keyword
        type = { italic = false }, -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = false }, -- struct, union, enum, etc
        parameter = { italic = false }, -- parameter pass in function
        annotation = { italic = false },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
      },
      inc_search = "background", -- underline | background
      background_clear = {
        "lazygit",
        -- "float_win",
        "toggleterm",
        "telescope",
        "which-key",
        "renamer",
        "notify",
        "neo-tree",
        -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
      }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
        },
      },
    },
  },
}
