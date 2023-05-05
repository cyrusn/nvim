local status_ok, cursorline = pcall(require, "nvim-cursorline")

if not status_ok then
  return
end

cursorline.setup({
  cursorline = {
    enable = true,
      timeout = 0,
    number = true,
  },
})
