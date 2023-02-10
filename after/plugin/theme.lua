local vim = vim

require("nightfox").setup({
    options = {
        transparent = true,
    },
})
require("lualine").setup({ options = { theme = "nightfox" } })

vim.cmd("colorscheme nightfox")
vim.cmd("highlight IndentBlanklineChar guifg=#3E4452 gui=nocombine")
vim.cmd("highlight IndentBlanklineContextChar guifg=#dddddd gui=nocombine")
