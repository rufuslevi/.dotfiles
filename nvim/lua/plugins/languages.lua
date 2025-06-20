return {
  {
    "jbyuki/nabla.nvim",
  },
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    enabled = false,
    lazy = true,
    cmd = "ConformInfo",
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_fallback = true, -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        css = { "stylelint" },
        gdscript = { "gdformat" },
        py = { "black" },
      },
    },
  },
}
