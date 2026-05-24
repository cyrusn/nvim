# Copilot instructions for this repository

Purpose
- Provide concise project-specific guidance so Copilot sessions produce useful, context-aware suggestions for this Neovim configuration.

Build / test / lint commands
- This repo is a Neovim configuration; there are no automated test suites or CI workflows present.
- Installation (macOS):
  - brew install neovim
  - git clone https://github.com/cyrusn/nvim.git ~/.config/nvim
  - nvim ~/.config/nvim/
- Formatting: handled in-editor by conform.nvim. Use the in-editor mapping to format a buffer: `<leader>cf` (calls require('conform').format()).
- Common external formatters (configured in conform.lua):
  - Lua: stylua
  - JS/TS/HTML/CSS/Vue: prettier
  - Markdown: markdownlint
  - Go: goimports / gofmt
  - C: clang-format
  - Shell: beautysh / fish_indent
- To run a formatter manually: run the tool for that language (e.g., `stylua <file>` or `prettier --write <file>`).

High-level architecture
- Entry: `init.lua` — sets leader keys and dynamically requires every file in `lua/config/*.lua` and `lua/plugins/*.lua`.
- lua/config/: editor options, keymaps, autocmds and other behavioural config.
- lua/plugins/: each plugin's setup and pack declaration lives here (plugins are loaded by `init.lua`).
- Package manager: repo references `lazy.vim` in README; plugin files also call `vim.pack.add()` to ensure packs are available.
- Formatting is centralized via `lua/plugins/conform.lua`.

Key conventions and patterns
- Auto-loader pattern: add per-feature files under `lua/config/` and `lua/plugins/`. Files are auto-required by filename (no need to add requires elsewhere).
- Package additions: use `vim.pack.add({ "<repo>" })` inside a `lua/plugins/*.lua` file to declare a plugin.
- Unused folder: files inside an `unused` folder are intentionally not loaded; keep experiments there.
- Key mappings and helper commands to know:
  - `<leader>cf` → format (conform)
  - `<leader>lp` → pack update
  - `<leader>ld` → delete a pack (interactive)
  - `<leader>lr` → restart
  - `<leader>lh` → checkhealth
  - Leader key is `space`; local leader is `\`.
- Editor defaults: 2-space indent (shiftwidth/tabstop = 2), relative numbers, spell checking enabled for English.

Files to check first when changing behavior
- `init.lua` — loader and global leaders
- `lua/config/options.lua` — core editor options
- `lua/config/keymaps.lua` — key mappings (pack commands, format mapping)
- `lua/plugins/conform.lua` — formatting configuration
- `lua/plugins/copilot.lua` — copilot plugin declaration (uses vim.pack.add)

AI assistant / other assistant configs
- No separate assistant config files (CLAUDE.md, AGENTS.md, .cursorrules, etc.) were incorporated.

Notes for Copilot sessions
- Prioritize changes inside `lua/plugins/` for plugin behavior and `lua/config/` for editor behavior.
- When suggesting new plugins: place their declaration in `lua/plugins/<name>.lua` and follow existing pattern (`vim.pack.add(...)` + require setup).
- For formatting changes, update `lua/plugins/conform.lua` and document any added external tool requirements in README.

If you'd like, the repository can be extended with a short CI workflow for linting/format checks or a README section listing required external formatter binaries. Want adjustments or coverage for anything I may have missed?