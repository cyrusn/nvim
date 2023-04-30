-- tokyonight
local status_ok, scheme = pcall(require, "tokyonight")

if not status_ok then
  return
end

scheme.setup({
  style = 'night',
  dim_inactive = true,
  transparent = false,
})
vim.cmd('colorscheme tokyonight')
