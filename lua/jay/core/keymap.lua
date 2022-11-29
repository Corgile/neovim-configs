vim.g.mapleader = " "

local keymap = vim.keymap

-- isert mode
keymap.set("i", "jk", "<ESC>")


-- normal mode
keymap.set("n", "x", '"_x')             -- 删除而不是剪切
keymap.set("n", "<LEADER>+", "<C-a>")   -- 增加数值
keymap.set("n", "<LEADER>-", "<C-x>")   -- 减小数值
keymap.set("n", "S", ":w<CR>")   -- 减小数值
keymap.set("n", "Q", ":wq<CR>")   -- 减小数值

----- split window
keymap.set("n", "<LEADER>sv", "<C-w>v")     -- split vertically
keymap.set("n", "<LEADER>sh", "<C-w>s")     -- split horizontally
keymap.set("n", "<LEADER>se", "<C-w>=")     -- adjust split windows to the same height/width
keymap.set("n", "<LEADER>sc", ":close<CR>") -- close current split window
keymap.set("n", "<C-LEFT>",  ":TmuxNavigateLeft<CR>")
keymap.set("n", "<C-RIGHT>", ":TmuxNavigateRight<CR>")
keymap.set("n", "<C-UP>",    ":TmuxNavigateUp<CR>")
keymap.set("n", "<C-DOWN>",  ":TmuxNavigateDown<CR>")

-- tab management
keymap.set("n", "<M-LEFT>",  ":BufferLineCyclePrev<CR>")  -- close current tab
keymap.set("n", "<M-RIGHT>", ":BufferLineCycleNext<CR>")    -- next tab
keymap.set("n", "<LEADER>b", ":BufferLinePick<CR>")    -- previous tab
keymap.set("n", "<LEADER>x", ":BufferLinePickClose<CR>")    -- previous tab

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
-- macro
keymap.set("n", "<C-CR>", "@z")

------ Plugin keymaps

-- maximize and restore split window
keymap.set("n", "<LEADER>sm", ":MaximizerToggle<CR>")
-- nvim-tree
keymap.set("n", "<LEADER>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<LEADER>m", ":NvimTreeFocus<CR>")
-- keymap.set("n", "<Left>", ":NvimTreeCollapes")
-- keymap.set("n", "<Right>", ":NvimTreeOpen")
-- fuzzy finder / telescope
keymap.set("n", "<LEADER>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<LEADER>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<LEADER>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<LEADER>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<LEADER>fh", "<cmd>Telescope help_tags<CR>")
-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<LEADER>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
