vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  vim.cmd('colorscheme rose-pine')

  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('nvim-treesitter/playground')

  use('theprimeagen/harpoon')

  use('tpope/vim-fugitive')

  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ('karb94/neoscroll.nvim')

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use("karb94/neoscroll.nvim")

  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',   -- Buffer source
      'hrsh7th/cmp-path',     -- Path source
      'hrsh7th/cmp-cmdline',  -- Command-line source
      'L3MON4D3/LuaSnip',     -- Snippets
    }
  }

end)


