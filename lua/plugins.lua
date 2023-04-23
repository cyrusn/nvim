-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      -- https://github.com/debugloop/telescope-undo.nvim
      { "debugloop/telescope-undo.nvim" },
    }
  }

  -- colorscheme
  use('folke/tokyonight.nvim')
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- copilot
  -- https://github.com/github/copilot.vim
  use("github/copilot.vim")

  -- autopairs
  -- https://github.com/jiangmiao/auto-pairs
  use("windwp/nvim-autopairs")

  -- layout
  -- https://github.com/akinsho/bufferline.nvim
  use("akinsho/bufferline.nvim")
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use("lukas-reineke/indent-blankline.nvim")
  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- key binding tips
  -- https://github.com/folke/which-key.nvim
  use("folke/which-key.nvim")

  -- for syntax highlight
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-context");


  -- Sidebar
  -- https://github.com/nvim-tree/nvim-tree.lua
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- Git
  -- https://github.com/lewis6991/gitsigns.nvim
  use("lewis6991/gitsigns.nvim")

  -- A pretty list for showing diagnostics --
  -- https://github.com/folke/trouble.nvim
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = false,
      }
    end
  })

  -- LSP
  -- https://github.com/VonHeikemen/lsp-zero.nvim
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- https://github.com/williamboman/mason.nvim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Terminal
  -- https://github.com/akinsho/toggleterm.nvim
  use("akinsho/toggleterm.nvim")

  -- Project management
  -- https://github.com/ahmedkhalf/project.nvim
  use("ahmedkhalf/project.nvim")

  -- close buffer gracefully
  -- https://github.com/moll/vim-bbye
  use('moll/vim-bbye')
end)
