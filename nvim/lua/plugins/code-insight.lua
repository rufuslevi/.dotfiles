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
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
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
