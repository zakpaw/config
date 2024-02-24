require("catppuccin").setup({
    transparent_background = false,
    flavour = "mocha",
    styles = {
        comments = { "italic" },
    }
})
vim.cmd.colorscheme "catppuccin"

-- transparent background
local transparent_elements = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "LineNr",
    "Folded",
    "NonText",
    "SpecialKey",
    "VertSplit",
    "SignColumn",
    "EndOfBuffer",
    "CursorLine",
}
for _, elem in pairs(transparent_elements) do
    vim.cmd("hi "..elem.." guibg=NONE ctermbg=NONE")
end
