-- This contains all the specs to load the extensions modifying the UI

return {
  {
    -- Remove all background colors to make nvim transparent.
    "xiyaowong/transparent.nvim",
  },
  {
    -- Colors colors codes in editor
    "NvChad/nvim-colorizer.lua",
  },
  { "echasnovski/mini.bufremove" },
  {
    -- To read about an element quickly
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    keys = {
      {
        "<leader>h",
        function()
          require("pretty_hover").hover()
        end,
        desc = "Hover",
        remap = true,
      },
    },
  },
  {
    "tamton-aquib/duck.nvim",
    config = function()
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch()
      end, {})
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, {})
    end,
  },
}
