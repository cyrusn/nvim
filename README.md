# my neovim settings

## Installation (macOS)

```sh
brew install neovim
git clone https://github.com/cyrusn/nvim.git ~/.config/nvim
nvim ~/.config/nvim/
```

## Structure

- `init.lua`: sets leader keys, loads `lua/config/*.lua`, and recursively loads
  `lua/plugins/**/*.lua` with nested plugin modules first
- `lua/config/`: core editor behavior (options, keymaps, autocmds)
- `lua/plugins/`: plugin declarations and per-plugin setup
- `lua/plugins/mini/`: Mini.nvim module configs, including completion and snippets
- `lua/plugins/snacks/`: retained Snacks.nvim setup, keymaps, and feature toggles
- `lua/archived/`: not auto-loaded by `init.lua`; keep old/experimental modules here
- `lua/archived/snacks/`: unchanged backup of the pre-MiniPick Snacks setup

## Productivity

- `snacks.nvim` provides big-file handling, indentation guides, Lazygit,
  quick-file startup, scratch buffers, terminal, file rename, and UI features
  without a comparable Mini module.
- `mini.nvim` provides buffer removal, notifications, indent scopes,
  statuscolumn, sessions, keymap hints, editor behavior, movement helpers,
  icons, and the picker UI.
- MiniBufremove keeps the existing save/no/cancel prompt for modified buffers.

## Plugin management

- Plugins are declared with `vim.pack.add(...)` inside `lua/plugins/`.
- `mini.icons` supplies file icons to Snacks, so no standalone icon plugin is
  required.

## Plugin roles

- MiniPick and MiniExtra provide the picker and its built-in LSP, diagnostics,
  Git, history, and navigation sources.
- Keep MiniCompletion, Conform, and Treesitter for completion, formatting, and
  parser management respectively.
- Keep Mason, Mason LSP Config, and Mason Tool Installer together: the
  integration translates Neovim LSP server names to Mason package names.
- Keep Sidekick and Copilot Vim together: Sidekick's Next Edit Suggestions use
  the Copilot LSP.
- `mini.git` provides repository data and `:Git`; `mini.diff` provides Git
  hunk signs and actions.

## Statusline

- The native statusline shows mode, a Git-project-relative path, modified and
  readonly state, filetype, progress, and cursor position.

## Git hunks

- `[h` and `]h` move between hunks; `ih` selects the hunk under the cursor.
- `<leader>gs` stages and `<leader>gr` resets the current hunk. Their visual
  mode variants apply to the selection; `<leader>gp` toggles the hunk overlay.
- `<leader>gS`, `<leader>gR`, and `<leader>gu` stage, reset, and unstage the
  current buffer. `<leader>gB` opens a vertical blame view.
- Mini Diff cannot unstage individual hunks; use `:Git restore --staged -- %`
  for the current buffer or Snacks Lazygit for full Git operations.
- Key package commands:
  - `<leader>lp`: update packs
  - `<leader>ld`: delete pack (interactive)
  - `<leader>lm`: open Mason

## Language support

- MiniCompletion supplies LSP completion, documentation, and signature help.
- MiniSnippets loads the friendly-snippets collection; `<Tab>` advances snippets,
  navigates the Mini completion menu, applies Sidekick suggestions, then accepts
  Copilot ghost text as a fallback.
- MiniPick handles file, grep, buffer, Git, diagnostics, history, and LSP
  pickers; MiniExtra adds sources beyond MiniPick's core built-ins. `<C-n>` /
  `<C-p>` move through matches, `<CR>` selects, and `<Tab>` toggles the preview.
  `<M-a>` sends the current or marked file locations to Sidekick.
  Mini completion and Copilot ghost text are temporarily suppressed in the
  source editor buffer while a MiniPick picker is open, then restored on close.
- MiniPick is not a one-for-one Snacks picker clone: project discovery uses
  recent files, undo history has a simpler sequence list, and LSP call
  hierarchy uses Neovim's native actions rather than a picker.
- MiniNotify handles notification display and history with different window
  styling and queue behavior from Snacks. MiniIndentscope supplies indent-based
  scope visualization, motions, and textobjects; unlike `snacks.scope`, it
  does not detect scopes from Tree-sitter syntax.
- MiniStatuscolumn shows line numbers, folds, and signs using Mini's default
  layout instead of Snacks' separately prioritized Git/sign sections.
- Snacks indentation guides remain enabled; MiniIndentscope replaces only the
  current-scope indicator and indent-based scope motions/textobjects.
- All toggle mappings, including standard options and diagnostics, use the
  Snacks toggle API in `lua/plugins/snacks/toggles.lua`. Animation toggling is
  omitted because animation is not used.
- Direct LSP actions: `K` hover, `gd` definition, `gD` declaration, `gr`
  references, `<leader>rn` rename, `<leader>ca` code actions, `[d`/`]d`
  diagnostics, and `gl` line diagnostics.
- Python uses `basedpyright` through Mason.

## Sessions

- Sessions are saved under a project-root-based name, preventing collisions
  between directories with the same basename.
- `<leader>ql` loads the project session. If only a legacy basename session
  exists, it is loaded once and the next exit saves the new project-safe name.

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
