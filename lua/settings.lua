local vim = vim
vim.wo.relativenumber = true
vim.o.number = true
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_session_directory = '/home/morten/nvim/session'
vim.o.termguicolors = true
vim.o.errorbells = false
vim.o.smartcase = true
vim.o.directory = '/home/morten/.cache/nvim/swap'
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.completeopt='menuone,noinsert,noselect,preview'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.wo.wrap = false

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
