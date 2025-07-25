require("nvim-treesitter.configs").setup({
    ensure_installed = { "help", "javascript", "typescript", "tsx", "json", "python", "c", "lua", "rust", "php", "html" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
})

vim.treesitter.language.register("html", "ejs")
vim.treesitter.language.register("javascript", "ejs")
vim.treesitter.language.register("embedded_template", "ejs")
