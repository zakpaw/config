require("nvim-treesitter.install").compilers = { "gcc" }
require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    autotag = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "svelte",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "python",
        "rust",
        "sql",
        "hcl",
        "toml"
    },
    auto_install = true,
})
