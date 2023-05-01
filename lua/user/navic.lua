local navic = require("nvim-navic")
navic.setup({
  lsp = {
    auto_attach = true
  }
})

require("lspconfig").clangd.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
}
