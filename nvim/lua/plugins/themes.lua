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
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
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
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
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

          ----- Settings for sonokai -----
          vim.cmd("colorscheme sonokai")
          require("lualine").setup({ options = { theme = "sonokai" } })

          ----- Settings for others -----
          -- vim.cmd("colorscheme catppuccin-mocha")
          -- vim.cmd("colorscheme monokai-pro-ristretto")

          -- require("lualine").setup({ options = { theme = "monokai-pro" } })
        end,
        set_light_mode = function()
          vim.api.nvim_set_option("background", "light")

          ----- Settings for solarized theme -----
          -- vim.cmd("colorscheme
          -- vim.g.solarized_diffmode = "high"
          -- To enable transparency
          -- vim.g.solarized_termtrans = 1

          -- vim.cmd("colorscheme ayu")

          --- -- Settings for catppuccin -----
          -- vim.cmd("colorscheme catppuccin-latte")
          vim.cmd("colorscheme catppuccin-frappe")
          -- vim.cmd("colorscheme catppuccin-macchiato")
          require("lualine").setup({ options = { theme = "catppuccin" } })

          ----- Settings for vim-one light -----
          -- vim.cmd("colorscheme one")
          -- require("lualine").setup({ options = { theme = "onelight" } })

          ----- Settings for onelight -----
          -- vim.cmd("colorscheme onelight")
          -- require("lualine").setup({ options = { theme = "onelight" } })

          ----- Settings for solarized -----
          -- vim.cmd("colorscheme solarized")
          -- require("lualine").setup({ options = { theme = "solarized" } })

          ----- Settings for NeoSolarized -----
          -- vim.cmd("colorscheme NeoSolarized")
          -- require("lualine").setup({ options = { theme = "NeoSolarized" } })

          ----- Settings for Sonokai -----
          -- vim.cmd("colorscheme sonokai")
          -- require("lualine").setup({ options = { theme = "sonokai" } })

          ----- Settings for Sonokai -----
          -- vim.cmd("colorscheme gruvbox")
          -- require("lualine").setup({ options = { theme = "gruvbox" } })
        end,
      })
      require("auto-dark-mode").init()
    end,
  },
}
