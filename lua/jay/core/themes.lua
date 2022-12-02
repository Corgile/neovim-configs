-- execute vim command to set the theme
-- vim.cmd("colorscheme catppuccin-macchiato")
vim.cmd("colorscheme nightfly")
-- latte, macchiato, frappe

-- local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
-- local ok, _ = pcall(vim.cmd, "colorscheme catppuccin-macchiato")
local ok, _ = pcall(vim.cmd, "colorscheme nightfly")

if not ok then print("Colorscheme Not Found!") return end
