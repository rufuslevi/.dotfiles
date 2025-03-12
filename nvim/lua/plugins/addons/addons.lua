-- This contains all the specs to load the plugins that add to the experience

return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
  {
    "mbbill/undotree",
  },
  {
    "marioortizmanero/adoc-pdf-live.nvim",
    lazy = true,
    ft = { "pdf" },
    config = function()
      require("adoc_pdf_live").setup()
    end,
  },
  {
    -- WebSearch from neovim
    "aliqyan-21/wit.nvim",
    config = function()
      require("wit").setup()
    end,
  },
  {
    "dccsillag/magma-nvim",
    run = "UpdateRemotePlugins",
    keys = {
      { "<leader>mi", "<cmd>MagmaInit<CR>", desc = "This command initializes a runtime for the current buffer." },
      { "<leader>mo", "<cmd>MagmaEvaluateOperator<CR>", desc = "Evaluate the text given by some operator." },
      { "<leader>ml", "<cmd>MagmaEvaluateLine<CR>", desc = "Evaluate the current line." },
      { "<leader>mv", "<cmd>MagmaEvaluateVisual<CR>", desc = "Evaluate the selected text." },
      { "<leader>mc", "<cmd>MagmaEvaluateOperator<CR>", desc = "Reevaluate the currently selected cell." },
      { "<leader>mr", "<cmd>MagmaRestart!<CR>", desc = "Shuts down and restarts the current kernel." },
      {
        "<leader>mx",
        "<cmd>MagmaInterrupt<CR>",
        desc = "Interrupts the currently running cell and does nothing if not cell is running.",
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      dir_path = "img",
    },
    keys = {
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
