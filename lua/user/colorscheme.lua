local status_ok, scheme = pcall(require, "tokyonight")

if not status_ok then
  return
end


-- scheme.setup({
--   flavour = "mocha",
--   transparent_background = true,
-- })


scheme.setup({
  style = 'night',
  dim_inactive = true,
})


vim.cmd('colorscheme tokyonight')
