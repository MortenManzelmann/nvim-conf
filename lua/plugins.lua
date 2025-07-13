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
use("wbthomason/packer.nvim")
use 'navarasu/onedark.nvim'
use({
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  requires = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Useful status updates for LSP
    "j-hui/fidget.nvim",

    -- Additional lua configuration, makes nvim stuff amazing
    "folke/neodev.nvim",
    "mfussenegger/nvim-dap",
  },
})
use({
  "hrsh7th/nvim-cmp",
  requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
})
use({
  "nvimtools/none-ls.nvim",
  requires = { "nvim-lua/plenary.nvim" },
})
use({ "nvim-lualine/lualine.nvim" })
use({ "kyazdani42/nvim-tree.lua" })
use({ "kyazdani42/nvim-web-devicons" })
use({
  "nvim-telescope/telescope.nvim",
  requires = { { "nvim-lua/plenary.nvim" } },
})
use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
use("nvim-treesitter/playground")
use("mbbill/undotree")
use("windwp/nvim-ts-autotag")
use("windwp/nvim-autopairs")
use("lewis6991/gitsigns.nvim")
use("dinhhuy258/git.nvim")
use("tpope/vim-commentary")
use("lukas-reineke/indent-blankline.nvim")
use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })
if PACKER_BOOTSTRAP then
  require("packer").sync()
end
