local status_ok, noice = pcall(require, "noice")

if not status_ok then
  return
end

noice.setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and cmd_popup together
    long_message_to_split = true, -- long messages will be sent to a split
  },
  cmdline = {
    view = 'cmdline'
  },
  messages = {
    view = 'mini',
  },
  notify = {
    view = 'mini'
  }
})
