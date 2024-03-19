---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

local api = vim.api
local getNvimTreeWidth = function()
  for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
    if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

local NvimTreeTitle = function(title)
  local width = getNvimTreeWidth()
  if width == 0 then
    return ""
  end
  local titleLen = #title
  local leftPadding = math.floor((width - titleLen) / 2)
  local realTitle = string.rep(" ", leftPadding)
  realTitle = realTitle .. title .. string.rep(" ", width - leftPadding - titleLen)
  return "%#NvimTreeNormal#" .. (vim.g.nvimtree_side == "right" and "" or realTitle)
end


M.ui = {
  theme = "everblush",
  theme_toggle = { "everblush", "github_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  tabufline = {
    enabled = true,
    lazyload = false,
    overriden_modules = function(modules)
      modules[1] = NvimTreeTitle "Project View"
    end,
  },
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  New Buffer", "Ctrl n", "enew" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
