-- LSP
return {
  -- Information
  { 'n', '<leader>d',  '<cmd>lua vim.lsp.buf.definition()<CR>',      'Definition' },
  { 'n', '<leader>r',  '<cmd>lua vim.lsp.buf.references()<CR>',      'References' },
  -- Basic
  { 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.signature_help()<CR>',  'Signature help' },
  { 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>',     'Code action' },
  { 'n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>',   'Show diagnostics' },
  { 'n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>',     'Declaration' },
  { 'n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>',  'Implementation' },
  { 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>',          'Rename' },
  { 'n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition' },
}
