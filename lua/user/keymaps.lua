-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<M-CR>", "@q<CMD>lua print('重复上一次操作')<CR>")
-- home / end
keymap("n", "<S-LEFT>", "^")
keymap("n", "<S-RIGHT>", "$")

-- folding
keymap("v", "-", "zf") -- fold selected lines
keymap("n", "-", "zfi") -- -{  fold between {}

-- previous / next edited place
keymap("n", "<M-,>", "g;")
keymap("n", "<M-.>", "g,")

-- Better window navigation
keymap("n", "<C-DOWN>", "<C-w>j", opts)
keymap("n", "<C-UP>", "<C-w>k", opts)
keymap("n", "<C-LEFT>", "<C-w>h", opts)
keymap("n", "<C-RIGHT>", "<C-w>l", opts)
keymap("n", "<LEADER>r", "<CMD>luafile %<CR><CMD>lua print('已重新载入当前文件')<CR>", opts)

-- Resize with arrows
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<M-RIGHT>", ":bnext<CR>", opts)
keymap("n", "<M-LEFT>",  ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<LEADER>n", "<CMD>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<CMD>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "S", "<CMD>w<CR>", opts)

-- Plugins --

-- NvimTree
keymap("n", "<LEADER>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<LEADER>/", "<CMD>NvimTreeFindFile<CR>", opts)
-- Telescope
keymap("n", "<LEADER>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<LEADER>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<LEADER>fp", ":Telescope projects<CR>", opts)
keymap("n", "<LEADER>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<LEADER>gg", "<CMD>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<C-/>", "<CMD>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<C-/>", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<LEADER>db", "<CMD>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<LEADER>dc", "<CMD>lua require'dap'.continue()<cr>", opts)
keymap("n", "<LEADER>di", "<CMD>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<LEADER>do", "<CMD>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<LEADER>dO", "<CMD>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<LEADER>dr", "<CMD>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<LEADER>dl", "<CMD>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<LEADER>du", "<CMD>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<LEADER>dt", "<CMD>lua require'dap'.terminate()<cr>", opts)
