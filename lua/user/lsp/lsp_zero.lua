local status_ok, lsp = pcall(require, 'lsp-zero')

if not status_ok then
  return
end

lsp.preset({})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.on_attach(function()
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
