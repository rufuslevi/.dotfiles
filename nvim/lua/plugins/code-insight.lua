-- This contains all the specs to load the plugins adding insight on the current code

return {
  {
    "tpope/vim-sleuth",
    enabled = true,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
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
