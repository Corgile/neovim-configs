-- execute vim command to set the theme
vim.cmd("colorscheme catppuccin-macchiato")
-- latte, macchiato, frappe

-- local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
local ok, _ = pcall(vim.cmd, "colorscheme catppuccin-macchiato")

if not ok then print("Colorscheme Not Found!") return end
