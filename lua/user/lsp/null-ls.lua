local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
  return
end


local sources = {
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.formatting.prettier.with({
    extra_filetypes = {
      "markdown",
    },
  }),
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.shfmt,
}

null_ls.setup({ sources = sources })
