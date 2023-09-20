-- This contains all the specs to load the extensions modifying the UI

return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
}
