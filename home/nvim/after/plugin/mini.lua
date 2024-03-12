require("mini.files").setup({
    default_file_explorer = true,
    windows = {
        preview = true,
        width_focus = 36,
        width_nofocus = 36,
        width_preview = 36,
    },
    mappings = {
        go_in = 'L',
        go_in_plus = 'l',
    },
})

require("mini.surround").setup({
    mappings = {
        find = '',
        find_left = '',
        suffix_last = '',
        suffix_next = '',
        update_n_lines = '',
    },
    respect_selection_type = true,
    silent = true,
})
