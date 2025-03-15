-- This contains all the specs to load the themes plugins

return {
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "shaunsingh/solarized.nvim",
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        day_night = {
          enable = true, -- turn off by default
          day_filter = "light", -- classic | octagon | pro | machine | ristretto | spectrum
          night_filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
        },
      })
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_style = "shusia"
    end,
  },
  {
    "phha/zenburn.nvim",
    enabled = false,
    config = function()
      require("zenburn").setup()
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
    },
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = true,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = true,
          mini = true,
          mason = true,
          treesitter = true,
          treesitter_context = true,
        },
      })
    end,
  },
  {
    "rakr/vim-one",
  },
  {
    "navarasu/onedark.nvim",
    enabled = false,
    config = function()
      require("onedark").setup({
        style = "light",
        lualine = {
          transparent = false, -- lualine center bar transparency
        },
      })
      require("onedark").load()
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },
  {
    "Shatur/neovim-ayu",
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    enabled = true,
    opts = {
      set_dark_mode = function()
        vim.cmd("colorscheme monokai-pro-octagon")
        require("lualine").setup({
          options = {
            theme = "auto",
          },
        })
      end,
      set_light_mode = function()
        vim.cmd("colorscheme rose-pine-dawn")
        require("lualine").setup({
          options = {
            theme = "rose-pine",
          },
        })
      end,
      update_interval = 1000,
      fallback = "dark",
      -- if vim.fn.hostname() == "luna" then
      --   require("auto-dark-mode").setup({
      --     update_interval = 1000,
      --     -- set_dark_mode = set_dark_mode,
      --     set_light_mode = set_light_mode,
      --   })
      --   require("auto-dark-mode").init()
      -- else
      --   set_dark_mode()
      -- end
    },
  },
}
