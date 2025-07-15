-- This contains all the specs to load the themes plugins

return {
  { "folke/tokyonight.nvim" },
  { "rakr/vim-one" },
  { "Shatur/neovim-ayu" },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
  },
  {
    -- Syncs the background of the terminal with nvim theme
    "typicode/bg.nvim",
    enabled = false,
    lazy = false,
  },
  {
    "f-person/auto-dark-mode.nvim",
    enabled = true,
    opts = {
      set_dark_mode = function()
        vim.cmd("colorscheme sonokai")
      end,
      set_light_mode = function()
        vim.cmd("colorscheme rose-pine-dawn")
      end,
      update_interval = 1000,
      fallback = "dark",
    },
  },
}
