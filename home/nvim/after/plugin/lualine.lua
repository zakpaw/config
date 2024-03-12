local lualine = require("lualine")

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local line_ratio = math.ceil(current_line * 100 / total_lines)
  return line_ratio.."%%"
end

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
local spacing = {
  function()
    return "%="
  end,
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch, diff },
    lualine_c = { "filename", spacing },
    lualine_x = { filetype },
    lualine_y = { "location" },
    lualine_z = { progress },
  },
}
