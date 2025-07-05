return {
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = "Nerdy",
    config = function()
      vim.keymap.set("n", "<leader>cE", require("telescope").extensions.nerdy.nerdy, { desc = "NerdIcons" })
    end,
  },
  {
    "allaman/emoji.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
    },
    opts = {
      enable_cmp_integration = true,
    },
    config = function(_, opts)
      require("emoji").setup(opts)
      -- optional for telescope integration
      local ts = require("telescope").load_extension("emoji")
      vim.keymap.set("n", "<leader>ce", ts.emoji, { desc = "[S]earch [E]moji" })
    end,
  },
}
