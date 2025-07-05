return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
    },
  },
}
