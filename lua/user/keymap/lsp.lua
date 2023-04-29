-- LSP
return {
  { 'n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>',           'Hover' },
  { 'n', '[d',         '<cmd>lua vim.diagnostic.goto_prev()<CR>',    'Previous diagnostic' },
  { 'n', ']d',         '<cmd>lua vim.diagnostic.goto_next()<CR>',    'Next diagnostic' },
  -- Information
  { 'n', '<leader>d',  '<cmd>lua vim.lsp.buf.definition()<CR>',      'Definition' },
  { 'n', '<leader>D',  '<cmd>lua vim.lsp.buf.declaration()<CR>',     'Declaration' },
  { 'n', '<leader>i',  '<cmd>lua vim.lsp.buf.implementation()<CR>',  'Implementation' },
  { 'n', '<leader>r',  '<cmd>lua vim.lsp.buf.references()<CR>',      'References' },
  { 'n', '<leader>t',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition' },
  -- Basic
  { 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.signature_help()<CR>',  'Signature help' },
  { 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>',          'Rename' },
  { 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>',     'Code action' },
  { 'n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>',   'Show diagnostics' },
}
