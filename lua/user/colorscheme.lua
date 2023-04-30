-- local status_ok, scheme = pcall(require, "tokyonight")
local status_ok, scheme = pcall(require, "catppuccin")

if not status_ok then
  return
end


-- scheme.setup({
--   flavour = "mocha",
--   transparent_background = true,
-- })


scheme.setup({
  -- tokyonight
  -- style = 'night',
  -- dim_inactive = true,

  -- catppuccin
  flavour = 'mocha',
  dim_inactive = {
    enabled = true,
  }
})


-- vim.cmd('colorscheme tokyonight')
vim.cmd('colorscheme catppuccin')
