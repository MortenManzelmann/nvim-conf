
--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local remap = vim.api.nvim_set_keymap

local key_mapper = function(mode, key, result)
  remap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

local insert_mode_remap = function(key, result)
  key_mapper('i', key, result)
end

local normal_mode_remap = function(key, result)
  key_mapper('n', key, result)
end

local visual_mode_remap = function(key, result)
  key_mapper('v', key, result)
end

-- keymap
key_mapper('', '<M-1>', ':NvimTreeToggle<CR>')
key_mapper('','<leader>h', ':noh<CR>')

insert_mode_remap('<leader>"', '""<left>' )
insert_mode_remap('<leader>\'', '\'\'<left>')
insert_mode_remap('<leader>(', '()<left>')
insert_mode_remap('<leader>[', '[]<left>')
insert_mode_remap('<leader>{', '{}<left>')
insert_mode_remap('<leader><', '<><left>')
insert_mode_remap('{<CR>', '{<CR><CR>}<ESC><up>')
insert_mode_remap('<leader>{;<CR>','{<CR><CR>};<ESC><up>')
insert_mode_remap('<M-j>', '<Esc>:m .+1<CR>==gi')
insert_mode_remap('<M-k>', '<Esc>:m .-2<CR>==gi')
visual_mode_remap('<M-j>', ':m \'>+1<CR>gv=gv')
visual_mode_remap('<M-k>', ':m \'<-2<CR>gv=gv')
normal_mode_remap( '<M-k>', ':m .-2<CR>==')
normal_mode_remap( '<M-j>', ':m .+1<CR>==')
normal_mode_remap( '<leader>b', ':buffer <TAB>')
normal_mode_remap( '<C-s>', ':w<CR>')
insert_mode_remap( '<C-s>', '<ESC>:w<CR>i')
normal_mode_remap('<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
normal_mode_remap('<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
normal_mode_remap('<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
normal_mode_remap('<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')

