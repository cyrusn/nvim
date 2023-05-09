-- catppuccino
local status_ok, scheme = pcall(require, "catppuccin")
if not status_ok then
  return
end

scheme.setup({
  favoour = 'mocha',
  transparent_background = true,
  integrations = {
    cmp         = true,
    gitsigns    = true,
    nvimtree    = true,
    telescope   = true,
    mason       = true,
    noice       = true,
    navic       = {
      enabled = true,
      custom_bg = "NONE",
    },
    treesitter  = true,
    lsp_trouble = true,
    which_key   = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})
vim.cmd('colorscheme catppuccin')
