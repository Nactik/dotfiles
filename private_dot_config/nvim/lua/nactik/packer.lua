-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use { "catppuccin/nvim", as = "catppuccin" }

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use {
        'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional

			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

  use { 'towolf/vim-helm', as = "vim-helm" }

  use {
  'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
  }

  -- use "jose-elias-alvarez/null-ls.nvim"
  use "nvimtools/none-ls.nvim"
  use "nvimtools/none-ls-extras.nvim"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Lua
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use { 'numToStr/Comment.nvim' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use { "lukas-reineke/indent-blankline.nvim"}

  use { "HiPhish/nvim-ts-rainbow2" }

  use { "github/copilot.vim" }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use { 'windwp/nvim-ts-autotag' }

  use {'mistricky/codesnap.nvim', run = 'make'}

  use {
    "mason-org/mason.nvim",
  }

  use { "mason-org/mason-lspconfig.nvim"}

  use {
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      requires = { 'rafamadriz/friendly-snippets' },

      -- use a release tag to download pre-built binaries
      tag = 'v1.*',
  }

end)
