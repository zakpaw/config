require("rest-nvim").setup({
    result_split_in_place = true,
})

vim.api.nvim_create_user_command(
    'RestNvim',
    function() require('rest-nvim').run() end,
    {desc = 'Run the REST request under the cursor'}
)

vim.api.nvim_create_user_command(
    'RestNvimPreview',
    function() require('rest-nvim').run(true) end,
    {desc = 'Preview the REST request cURL command'}
)

vim.api.nvim_create_user_command(
    'RestNvimLast',
    function() require('rest-nvim').last() end,
    {desc = 'Re-run the last REST request'}
)
