local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

local use = packer.use
use 'wbthomason/packer.nvim'
use 'EdenEast/nightfox.nvim'
use { -- LSP Configuration & Plugins
'neovim/nvim-lspconfig',
requires = {
  -- Automatically install LSPs to stdpath for neovim
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- Useful status updates for LSP
  'j-hui/fidget.nvim',

  -- Additional lua configuration, makes nvim stuff amazing
  'folke/neodev.nvim',
  "mfussenegger/nvim-dap"
},
  }

  use { -- Autocompletion
  'hrsh7th/nvim-cmp',
  requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
}
use({
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    require("null-ls").setup()
  end,
  requires = { "nvim-lua/plenary.nvim" },
})
use { 'nvim-lualine/lualine.nvim', }
use { 'kyazdani42/nvim-tree.lua', }
use { 'kyazdani42/nvim-web-devicons',}
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
} 
use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
use('nvim-treesitter/playground')
--   use 'tpope/vim-fugitive' -- Git commands in nvim
--   use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
--   use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
--   use 'ludovicchabant/vim-gutentags' -- Automatic tags management
-- Add indentation guides even on blank lines
--   use 'lukas-reineke/indent-blankline.nvim'
-- Add git related info in the signs columns and popups
--   use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
--   use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
--   use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
--   use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
--   use 'L3MON4D3/LuaSnip' -- Snippets plugin
--
--   use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
--
--   -- Post-install/update hook with neovim command
--   use 'nvim-treesitter/playground' 
--   use 'glepnir/dashboard-nvim'
--   use('jose-elias-alvarez/null-ls.nvim')
--   use('MunifTanjim/prettier.nvim')
if PACKER_BOOTSTRAP then
  require("packer").sync()
end
