-- vim.o.background = "light"
-- vim.cmd.colorscheme "gruvbox"

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
    "FloatBorder",
    "LineNr",
    "Folded",
    "NonText",
    "SpecialKey",
    "VertSplit",
    "SignColumn",
    "EndOfBuffer",
    "CursorLine",
    "WinSeparator",
}
for _, elem in pairs(transparent_elements) do
    vim.cmd("hi " .. elem .. " guibg=NONE ctermbg=NONE")
end
