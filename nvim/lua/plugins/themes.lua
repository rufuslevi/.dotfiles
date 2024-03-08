-- This contains all the specs to load the themes plugins

return {
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
  },
  {
    "shaunsingh/solarized.nvim",
    priority = 1000,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
  },
  {
    "phha/zenburn.nvim",
    priority = 1000,
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
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
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
          notify = false,
          mini = false,
          mason = true,
          treesitter = true,
          treesitter_context = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end,
  },
  {
    "rakr/vim-one",
    priority = 1000,
  },
  {
    "olimorris/onedarkpro.nvim",
    enabled = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    enabled = false,
    priority = 1000,
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
    "Shatur/neovim-ayu",
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    enabled = true,
    config = function()
      require("auto-dark-mode").setup({
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option("background", "dark")

          vim.cmd("colorscheme sonokai")
          require("lualine").setup({
            options = {
              theme = "sonokai",
            },
          })
        end,
        set_light_mode = function()
          vim.api.nvim_set_option("background", "light")

          vim.cmd("colorscheme rose-pine-dawn")
          require("lualine").setup({
            options = {
              theme = "rose-pine",
            },
          })
        end,
      })
      require("auto-dark-mode").init()
    end,
  },
}
