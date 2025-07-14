return {
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = "Nerdy",
    config = function()
      vim.keymap.set("n", "<leader>cE", ":Nerdy<CR>", { desc = "NerdIcons" })
    end,
  },
}
