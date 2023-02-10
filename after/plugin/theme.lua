local vim = vim

require('nightfox').setup({
    options = {
        transparent = true,
    },
})
require('lualine').setup { options = { theme = "nightfox" } }

pcall(vim.cmd, 'colorscheme nightfox')
