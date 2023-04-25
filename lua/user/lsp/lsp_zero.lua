local status_ok, lsp = pcall(require, 'lsp-zero')

if not status_ok then
  return
end

local keymap = require('user.helpers').keymap

lsp.preset({})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.on_attach(function(_, bufnr)
  lsp.buffer_autoformat()
end)

lsp.ensure_installed({
  'pyright', 'tailwindcss', 'volar', 'yamlls',
  'tsserver', 'rust_analyzer', 'html', 'jsonnet_ls', 'marksman',
})

lsp.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = ''
})

lsp.setup()

keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover')
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous diagnostic')
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next diagnostic')
-- Basic
keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help')
keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action')
keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', 'Format')
keymap('n', '<leader>ls', '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostics')
-- Go to
keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'Definition')
keymap('n', '<leader>lgc', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration')
keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation')
keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', 'References')
keymap('n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition')
