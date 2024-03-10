---@type MappingsTable
local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["<S-LEFT>"] = { "<ESC>^i", "Beginning of line" },
    ["<S-RIGHT>"] = { "<End>", "End of line" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- switch between windows
    ["<C-LEFT>"] = { "<C-w>h", "Window left" },
    ["<C-RIGHT>"] = { "<C-w>l", "Window right" },
    ["<C-DOWN>"] = { "<C-w>j", "Window down" },
    ["<C-UP>"] = { "<C-w>k", "Window up" },
    -- go to  beginning and end
    ["<S-LEFT>"] = { "^", "Beginning of line" },
    ["<S-RIGHT>"] = { "$", "End of line" },
    -- save
    ["<C-s>"] = { "<cmd>w<CR><cmd>lua vim.notify('已保存!',vim.log.levels.INFO)<CR>", "Save file" },
    -- new buffer
    ["<leader>b"] = { "<cmd> Telescope buffers<CR>", "Find Opend buffer" },
    -- toggle
    ["<C-n>"] = { "<cmd> enew <CR>", "New Buffer" },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

M.tabufline = {
  plugin = true,
  n = {
    -- cycle through buffers
    ["<M-RIGHT>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<M-LEFT>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}
return M
