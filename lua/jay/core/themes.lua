-- execute vim command to set the theme
vim.cmd("colorscheme catppuccin")
-- latte, macchiato, frappe

local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")

if not ok then print("Colorscheme Not Found!") return end
