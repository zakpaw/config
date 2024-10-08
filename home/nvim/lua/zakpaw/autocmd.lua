function SetCwdToTmuxAttach()
    local handle = io.popen("tmux display-message -p -F '#{pane_current_path}'")
    if handle then
        local tmux_cwd = handle:read("*a")
        handle:close()
        tmux_cwd = tmux_cwd:gsub("\n", "")
        if tmux_cwd ~= "" and vim.fn.isdirectory(tmux_cwd) == 1 then
            if vim.g.tmux_attached_directory == nil then
                vim.g.tmux_attached_directory = tmux_cwd
            end
            vim.cmd("cd " .. vim.fn.fnameescape(vim.g.tmux_attached_directory))
        end
    end
end

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    callback = function()
        SetCwdToTmuxAttach()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        SetCwdToTmuxAttach()
    end,
})

vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function(event)
        local filetype = vim.bo.filetype
        if filetype == "templ" then
            local filename = vim.fn.expand("%")
            vim.fn.system(string.format("templ fmt %s", vim.fn.shellescape(filename)))
            vim.cmd("edit!")
        else
            vim.lsp.buf.format({
                async = false,
                bufnr = event.bufnr,
            })
        end
    end
})
