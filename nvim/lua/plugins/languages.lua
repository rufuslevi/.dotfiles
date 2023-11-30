return {
  "LhKipp/nvim-nu",
  config = function()
    require("nu").setup({
      use_lsp_features = true,
    })
  end,
}
