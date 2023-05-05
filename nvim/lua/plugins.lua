-- Only required if you have packer configured as `opt'
-- `vim.cmd.packadd('packer.nvim')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}


	use 'folke/tokyonight.nvim'
	use {
	    'VonHeikemen/lsp-zero.nvim',
	    branch = 'v1.x',
	    requires = {
	      -- LSP Support
	      {'neovim/nvim-lspconfig'},             -- Required
	      {                                      -- Optional
		'williamboman/mason.nvim',
		build = function()
		  pcall(vim.cmd, 'MasonUpdate')
		end,
	      },
	      {'williamboman/mason-lspconfig.nvim'}, -- Optional

	      {'hrsh7th/nvim-cmp'},
	      	  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
		      -- Autocompletion
	      -- {'hrsh7th/nvim-cmp'},     -- Required
	      -- {'hrsh7th/cmp-nvim-lsp'}, -- Required
	      -- {'L3MON4D3/LuaSnip'},     -- Required
	    }
	  }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
