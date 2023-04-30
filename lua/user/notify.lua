local status_ok, notify = pcall(require, "notify")

if not status_ok then
  return
end

notify.setup({
  stages = "fade",
  timeout = 2000,
  render = 'minimal',
  top_down = true,
  max_width = 60,
  --  max_width = function()
  --    return vim.fn.winwidth(0) * 0.3
  --  end
})
