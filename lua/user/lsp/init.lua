require('user.lsp.lsp_zero')
require('user.lsp.cmp')
require('user.lsp.null-ls')

-- Show diagnostics in virtual text (inline with code)
vim.diagnostic.config({
  virtual_text = true
})
