vim.g.mapleader = " "

local keymap = vim.keymap

-- isert mode
keymap.set("i", "jk", "<ESC>")


-- normal mode
keymap.set("n", "x", '"_x')             -- 删除而不是剪切
keymap.set("n", "<leader>+", "<C-a>")   -- 增加数值
keymap.set("n", "<leader>-", "<C-x>")   -- 减小数值

----- split window
keymap.set("n", "<leader>sv", "<C-w>v")     -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- adjust split windows to the same height/width
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

-- tab management
keymap.set("n", "<leader>tt", ":tabnew<CR>")   -- new tab
keymap.set("n", "<leader>x", ":tabclose<CR>")  -- close current tab
keymap.set("n", "<leader>n", ":tabn<CR>")    -- next tab
keymap.set("n", "<leader>m", ":tabp<CR>")    -- previous tab

-------- Native mappings
-- home / end
keymap.set("n", "<M-LEFT>", "^")
keymap.set("n", "<M-RIGHT>", "$")

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
