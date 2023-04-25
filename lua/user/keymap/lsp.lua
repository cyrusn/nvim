-- LSP
return {
  { 'n', 'K',           '<cmd>lua vim.lsp.buf.hover()<CR>',           'Hover' },
  { 'n', '[d',          '<cmd>lua vim.diagnostic.goto_prev()<CR>',    'Previous diagnostic' },
  { 'n', ']d',          '<cmd>lua vim.diagnostic.goto_next()<CR>',    'Next diagnostic' },
  -- Basic
  { 'n', '<leader>lh',  '<cmd>lua vim.lsp.buf.signature_help()<CR>',  'Signature help' },
  { 'n', '<leader>lr',  '<cmd>lua vim.lsp.buf.rename()<CR>',          'Rename' },
  { 'n', '<leader>la',  '<cmd>lua vim.lsp.buf.code_action()<CR>',     'Code action' },
  { 'n', '<leader>lf',  '<cmd>lua vim.lsp.buf.format()<CR>',          'Format' },
  { 'n', '<leader>ls',  '<cmd>lua vim.diagnostic.open_float()<CR>',   'Show diagnostics' },
  -- Goto
  { 'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>',      'Definition' },
  { 'n', '<leader>lgc', '<cmd>lua vim.lsp.buf.declaration()<CR>',     'Declaration' },
  { 'n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>',  'Implementation' },
  { 'n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>',      'References' },
  { 'n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition' },
}
