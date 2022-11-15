vim.g.mapleader = " "

local keymap = vim.keymap

-- isert mode
keymap.set("i", "jk", "<ESC>")


-- normal mode
keymap.set("n", "x", '"_x')             -- 删除而不是剪切

----- split window
keymap.set("n", "<leader>sv", "<C-w>v")     -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- adjust split windows to the same height/width
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

-- move between windows
keymap.set("n", "<C-LEFT>", ":TmuxNavigateLeft<CR>")
keymap.set("n", "<C-RIGHT>", ":TmuxNavigateRight<CR>")
keymap.set("n", "<C-UP>", ":TmuxNavigateUp<CR>")
keymap.set("n", "<C-DOWN>", ":TmuxNavigateDown<CR>")

-- tab management, using bufferline.nvim
keymap.set("n", "<M-RIGHT>", ":BufferLineCycleNext<CR>")    -- select next tab
keymap.set("n", "<M-LEFT>",  ":BufferLineCyclePrev<CR>")    -- select previous tab
keymap.set("n", "<leader>b", ":BufferLinePick<CR>")         -- pick up a tab
keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")    -- pick up a tab to close

-------- Native mappings
-- home / end
keymap.set("n", "<S-LEFT>", "^")
keymap.set("n", "<S-RIGHT>", "$")

-- folding
keymap.set("v", "<BS>", "zf")   -- fold selected lines
keymap.set("n", "-", "zfi{")     -- -{  fold between {} 
-- previous / next edited place
keymap.set("n", "<M-,>", "g;")
keymap.set("n", "<M-.>", "g,")
-- moving by word
keymap.set("n", "w", "b")
keymap.set("n", "W", "B")

------ Plugin keymaps

-- maximize and restore split window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>")
-- keymap.set("n", "<Left>", ":NvimTreeCollapes")
-- keymap.set("n", "<Right>", ":NvimTreeOpen")
-- fuzzy finder / telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
