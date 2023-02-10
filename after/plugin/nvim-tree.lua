require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },
})
