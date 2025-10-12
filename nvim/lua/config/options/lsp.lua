vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
  virtual_text = true,
})
vim.g.lazyvim_python_ruff = "ruff"

vim.filetype.add({
  extension = {
    vert = "glsl",
    tesc = "glsl",
    tese = "glsl",
    frag = "glsl",
    geom = "glsl",
    comp = "glsl",
    fsh = "glsl",
    vsh = "glsl",
  },
})
