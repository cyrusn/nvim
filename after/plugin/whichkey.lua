local status_ok, which_key = pcall(require, "which-key")

if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,
    presets = {
      operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = false,     -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = false,           -- bindings for folds, spelling and others prefixed with z
      g = false,           -- bindings for prefixed with g
    },
  },
  ignore_missing = true,
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
  },
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}


local mappings = {
  ["e"]  = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["q"]  = { "<cmd>q<CR>", "Quit" },
  ["c"]  = { "<cmd>bd<CR>", "Close Buffer" },
  ["w"]  = { "<cmd>w<CR>", "Save" },
  ["b"]  = { "<cmd>Telescope buffers theme=dropdown previewer=false<cr>", "Search Buffers" },
  ["f"]  = { "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Find files" },
  ["F"]  = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  -- More
  ['m']  = { name = 'More' },
  ["mu"] = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
  ["mq"] = { "<cmd>qa<CR>", "Quit All" },
  -- LSP
  ["l"]  = { name = "LSP" },
  ["la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  ["ld"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics", },
  ["lw"] = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics", },
  ["lf"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
  ["li"] = { "<cmd>LspInfo<cr>", "Info" },
  ["lI"] = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  ["lj"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
  ["lk"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
  ["ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  ["lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  ["lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  ["ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  ["lS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
  -- Packer
  ["p"]  = { name = "Packer" },
  ["py"] = { "<cmd>PackerSync<cr>", "Sync" },
  ["ps"] = { "<cmd>:so<cr>", "Source File" },
  ["pu"] = { "<cmd>PackerUpdate<cr>", "Update" },
  -- Git
  ["g"]  = { name = "Git" },
  ["gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  ["gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  ["gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  ["gu"] = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
  ["go"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  ["gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  ["gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  ["gd"] = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
  -- Search
  ["s"]  = { name = "Search" },
  ["sh"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  ["sm"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  ["sr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  ["sc"] = { "<cmd>Telescope commands<cr>", "Commands" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
