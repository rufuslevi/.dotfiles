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
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", "~/.config/nvim/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
  {
    "jubnzv/virtual-types.nvim",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
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
