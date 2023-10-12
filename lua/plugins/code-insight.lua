-- This contains all the specs to load the plugins adding insight on the current code

return {
  {
    "tpope/vim-sleuth",
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
      padding = true,
      sticky = true,
      toggler = {
        line = "<leader>cl",
        block = "<leader>cb",
      },
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
    enabled = true,
    opts = { use_diagnostic_signs = true },
  },
  {
    "simrat39/inlay-hints.nvim",
    config = function()
      require("inlay-hints").setup()
    end,
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
    enabled = false,
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
}
