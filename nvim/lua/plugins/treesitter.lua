return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.indent, {
        enable = true,
      })
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "css",
        "gdscript",
        "godot_resource",
        "gdshader",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "matlab",
        "nix",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },
}
