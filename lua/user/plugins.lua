local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Fuzzy finder
  -- https://github.com/nvim-telescope/telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      -- https://github.com/debugloop/telescope-undo.nvim
      { "debugloop/telescope-undo.nvim" },
    },
  })

  -- colorscheme
  use("folke/tokyonight.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("marko-cerovac/material.nvim")
  use({ "rose-pine/neovim", as = "rose-pine" })

  -- https://github.com/github/copilot.vim
  use("github/copilot.vim")

  -- autopairs
  -- https://github.com/jiangmiao/auto-pairs
  use("windwp/nvim-autopairs")

  -- layout
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use("lukas-reineke/indent-blankline.nvim")

  -- https://github.com/nvim-lualine/lualine.nvim
  use("nvim-lualine/lualine.nvim")

  -- key binding tips
  -- https://github.com/folke/which-key.nvim
  use("folke/which-key.nvim")

  -- for syntax highlight
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-context")

  -- Sidebar
  -- https://github.com/nvim-tree/nvim-tree.lua
  use({
    "nvim-tree/nvim-tree.lua",
  })

  -- Git
  -- https://github.com/lewis6991/gitsigns.nvim
  use("lewis6991/gitsigns.nvim")

  -- A pretty list for showing diagnostics
  -- https://github.com/folke/trouble.nvim
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  })

  -- LSP
  -- https://github.com/VonHeikemen/lsp-zero.nvim
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      -- https://github.com/williamboman/mason.nvim
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      { "jose-elias-alvarez/null-ls.nvim" },
    },
  })

  -- Terminal
  -- https://github.com/akinsho/toggleterm.nvim
  use("akinsho/toggleterm.nvim")

  -- Project management
  -- https://github.com/ahmedkhalf/project.nvim
  use("ahmedkhalf/project.nvim")

  -- close buffer gracefully
  -- https://github.com/moll/vim-bbye
  use("moll/vim-bbye")

  -- cursorline
  -- https://github.com/yamatsum/nvim-cursorline
  use("yamatsum/nvim-cursorline")

  -- file icon
  -- https://github.com/nvim-tree/nvim-web-devicons
  use("nvim-tree/nvim-web-devicons")

  -- replace the ui
  -- https://github.com/folke/noice.nvim
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  })

  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  })

  use {
    'numToStr/Comment.nvim',
  }
  -- A fancy, configurable, notification manager for NeoVim
  -- https://github.com/rcarriga/nvim-notify
  -- use("rcarriga/nvim-notify")
  if packer_bootstrap then
    require("packer").sync()
  end
end)
