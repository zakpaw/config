local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


return require("lazy").setup({
    -- highlighting & formatting
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- cmp plugins
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/vim-vsnip",

    -- snippets
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    "rafamadriz/friendly-snippets",

    -- git
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    { "ThePrimeagen/git-worktree.nvim",           opts = {} },

    -- mini
    { "echasnovski/mini.files",                   version = false },
    { "echasnovski/mini.surround",                version = false },
    { "echasnovski/mini.ai",                      version = false },

    -- telescope
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    {
        "tami5/sqlite.lua",
        opt = true,
    },
    "AckslD/nvim-neoclip.lua",

    -- DBT
    {
        "PedramNavid/dbtpal",
        opt = true,
        config = function()
            local dbt = require("dbtpal")
            dbt.setup {
                path_to_dbt = "dbt",
                path_to_dbt_project = "",
                path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",
                extended_path_search = true,
                protect_compiled_files = true
            }
            vim.keymap.set("n", "<leader>drf", dbt.run)
            vim.keymap.set("n", "<leader>drp", dbt.run_all)
            vim.keymap.set("n", "<leader>dtf", dbt.test)
            vim.keymap.set("n", "<leader>dm", require("dbtpal.telescope").dbt_picker)
            require("telescope").load_extension("dbtpal")
        end,
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" } }
    },

    -- other
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
    "joerdav/templ.vim", -- go templ
    "christoomey/vim-tmux-navigator",
    "mbbill/undotree",
    "hashivim/vim-terraform",
    "jpalardy/vim-slime", -- ipython
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {
            disable_mouse = false,
            max_count = 4,
            restriction_mode = "hint",
            disabled_filetypes = {
                "netrw", "lazy", "mason", "minifiles"
            }
        }
    },
    {
        "kevinhwang91/nvim-fundo",
        dependencies = { "kevinhwang91/promise-async" },
        opts = {},
    },

    -- theme
    { "catppuccin/nvim", as = "catppuccin" },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = true,
    --     opts = ...
    -- },
    "kyazdani42/nvim-web-devicons",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons", opt = true }
    }
})
