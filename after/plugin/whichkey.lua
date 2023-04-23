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
  ["c"]  = { "<cmd>Bdelete<CR>", "Close Buffer" },
  ["w"]  = { "<cmd>w<CR>", "Save" },
  ["b"]  = { "<cmd>Telescope buffers theme=dropdown previewer=false<cr>", "Search Buffers" },
  ["f"]  = { "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Find files" },
  ["F"]  = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  ["u"]  = { "<cmd>Telescope undo<cr>", "Undo" },
  -- More
  ['m']  = { name = 'More' },
  ["mu"] = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
  ["ms"] = { "<cmd>:so<cr>", "Source File" },
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
  ["ps"] = { "<cmd>PackerSync<cr>", "Sync" },
  ["pu"] = { "<cmd>PackerUpdate<cr>", "Update" },
  -- Git
  ["g"]  = { name = "Git" },
  ["gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  ["gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  ["gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  ["gu"] = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
  ["gS"] = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer", },
  ["gR"] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer", },
  ["go"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  ["gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  ["gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  ["gd"] = { "<cmd>Gitsigns diffthis()<cr>", "Diff", },
  ["gD"] = { "<cmd>Gitsigns diffthis('~')<cr>", "Diff Head", },
  -- Search
  ["s"]  = { name = "Search" },
  ["sp"] = { "<cmd>Telescope projects theme=dropdown <cr>", "Projects" },
  ["sh"] = { "<cmd>Telescope help_tags theme=dropdown <cr>", "Helps" },
  ["sk"] = { "<cmd>Telescope keymaps theme=dropdown <cr>", "Keymaps" },
  ["sm"] = { "<cmd>Telescope man_pages theme=dropdown <cr>", "Man Pages" },
  ["sr"] = { "<cmd>Telescope oldfiles theme=dropdown <cr>", "Recent Files" },
  ["sc"] = { "<cmd>Telescope commands theme=dropdown <cr>", "Commands" },
}

which_key.setup(setup)
which_key.register(mappings, opts)

local gs = require('gitsigns')

local v_opts = {
  mode = "v",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local v_mappings = {
  ["g"] = {name = 'Git'},
  ["gs"] = { function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage Hunk" },
  ["gr"] = { function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset Hunk" },
}

which_key.register(v_mappings, v_opts)
