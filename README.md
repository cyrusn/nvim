# my neovim settings

## Installation (macOS)

```sh
brew install neovim
git clone https://github.com/cyrusn/nvim.git ~/.config/nvim
nvim ~/.config/nvim/
```

## Structure

- `init.lua`: sets leader keys and auto-loads `lua/config/*.lua` + `lua/plugins/*.lua`
- `lua/config/`: core editor behavior (options, keymaps, autocmds)
- `lua/plugins/`: plugin declarations and per-plugin setup
- `lua/archive/`: not auto-loaded by `init.lua`; keep old/experimental modules here

## Plugin management

- Plugins are declared with `vim.pack.add(...)` inside files under `lua/plugins/`
- Key package commands:
  - `<leader>lp`: update packs
  - `<leader>ld`: delete pack (interactive)
  - `<leader>lm`: open Mason

## Formatting

- `<leader>cf` formats current buffer/selection through `conform.nvim`
- Config lives in `lua/plugins/conform.lua`
- External formatters used by this config include:
  - `stylua` (Lua)
  - `prettier` (JS/TS/HTML/CSS/Vue/JSON)
  - `markdownlint` (Markdown)
  - `goimports` / `gofmt` (Go)
  - `clang-format` (C)
  - `beautysh` / `fish_indent` (Shell/Fish)
  - `sql_formatter` (SQL)
  - `yamlfmt` (YAML)
