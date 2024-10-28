vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basic normal
vim.keymap.set("n", "<leader>q", ":bd<cr>")
vim.keymap.set("n", "<leader>w", ":topleft vs<cr>|:Ex<cr>")
vim.keymap.set("n", "<s-H>", "^")
vim.keymap.set("n", "<s-L>", "$")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<Tab>", ":bnext<cr>")   -- next buffer
vim.keymap.set("n", "<S-Tab>", ":bprev<cr>") -- previous buffer

-- basic visual
vim.keymap.set("v", "p", "P")                    -- dont replace register after v p
vim.keymap.set("v", "<s-J>", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "<s-K>", ":m '<-2<CR>gv=gv") -- move line up
vim.keymap.set("v", "<s-H>", "^")
vim.keymap.set("v", "<s-L>", "$")

-- basic insert
vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})

-- telescope
vim.keymap.set("n", "<C-f>", function()
    require("mini.files").close()
    require("telescope.builtin").find_files()
end, {})
vim.keymap.set("n", "<C-g>", function()
    require("mini.files").close()
    require("telescope.builtin").live_grep()
end, {})
vim.keymap.set("n", "<C-s>", ":Telescope find_files hidden=true<cr>")
vim.keymap.set("n", "<C-b>", ":Telescope git_branches theme=dropdown<cr>")
vim.keymap.set("n", "<C-p>", ":Telescope neoclip plus theme=dropdown initial_mode=normal<cr>")
vim.keymap.set("n", "<leader><leader>", ":Telescope keymaps theme=dropdown<cr>")
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<cr>", { silent = true })
vim.keymap.set("n", "gr", ":Telescope lsp_references theme=dropdown<cr>")

-- mini
vim.keymap.set("n", "<leader>r",
    ":lua if not MiniFiles.close() then MiniFiles.open(vim.fn.expand('%:p')) end<cr>",
    { silent = true }
)
vim.keymap.set("n", "<leader>e", ":lua if not MiniFiles.close() then MiniFiles.open(...) end<cr>", { silent = true })

-- aider
vim.api.nvim_set_keymap('n', '<leader>at', ':AiderRun<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>aa', ':AiderAddCurrentFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ar', ':AiderAddCurrentFileReadOnly<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>aw', ':AiderAddWeb<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>aq', ':AiderExit<CR>', { noremap = true, silent = true })

-- other
vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "<F5>", ":UndotreeToggle<cr>")
vim.keymap.set("n", "<C-e>", ":lua vim.diagnostic.open_float({'line'})<cr>")
vim.keymap.set("n", "<C-c>", ":let @+=@%")
-- replace everywhere cfdo %s///g
