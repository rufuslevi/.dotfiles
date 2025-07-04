-- This contains all the specs to load the plugins adding insight on the current code

return {
  {
    -- Auto-update tab size based on file and other files in directory
    "tpope/vim-sleuth",
    enabled = true,
  },
  {
    -- Comments are more powerful with this plugin
    "numToStr/Comment.nvim",
    opts = {
      padding = true,
      sticky = true,
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      config = function()
        require("Comment").setup()
      end,
    },
  },
  {
    -- Adds type info over code
    "jubnzv/virtual-types.nvim",
  },
  {
    -- Detects and applies the detected wrapping mode
    "andrewferrier/wrapping.nvim",
    opts = {
      notify_on_switch = true,
      auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "mail",
        "markdown",
        "rst",
        "tex",
        "text",
      },
    },
  },
}
