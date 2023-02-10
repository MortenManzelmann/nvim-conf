local fn = require("functions")
--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap
fn.keyMapper("", "<M-1>", ":NvimTreeToggle<CR>")
fn.keyMapper("", "<leader>h", ":noh<CR>")

fn.insertModeRemap('<leader>"', '""<left>')
fn.insertModeRemap("<leader>'", "''<left>")
fn.insertModeRemap("<leader>(", "()<left>")
fn.insertModeRemap("<leader>[", "[]<left>")
fn.insertModeRemap("<leader>{", "{}<left>")
fn.insertModeRemap("<leader><", "<><left>")
fn.insertModeRemap("{<CR>", "{<CR><CR>}<ESC><up>")
fn.insertModeRemap("<leader>{;<CR>", "{<CR><CR>};<ESC><up>")
fn.insertModeRemap("<M-j>", "<Esc>:m .+1<CR>==gi")
fn.insertModeRemap("<M-k>", "<Esc>:m .-2<CR>==gi")
fn.visualModeRemap("<M-j>", ":m '>+1<CR>gv=gv")
fn.visualModeRemap("<M-k>", ":m '<-2<CR>gv=gv")
fn.normalModeRemap("<M-k>", ":m .-2<CR>==")
fn.normalModeRemap("<M-j>", ":m .+1<CR>==")
fn.normalModeRemap("<leader>b", ":buffer <TAB>")
fn.normalModeRemap("<C-s>", ":w<CR>")
fn.insertModeRemap("<C-s>", "<ESC>:w<CR>i")
fn.normalModeRemap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
fn.normalModeRemap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
fn.normalModeRemap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
fn.normalModeRemap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
