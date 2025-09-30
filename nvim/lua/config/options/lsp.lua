vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
  virtual_text = true,
})
vim.g.lazyvim_python_ruff = "ruff"

vim.treesitter.language.register("glsl", "fsh")
vim.treesitter.language.register("glsl", "v")
