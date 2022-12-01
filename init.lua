-- 插件配置，要在最上边
require("jay.plugin-setup")
-- 基础配置
require("jay.core.option")
-- 键盘映射
require("jay.core.keymap")
-- 主题
require("jay.core.themes")

-- 特定插件，一些插件需要配置才能运行
require("jay.plugin.comment")   -- 注释
require("jay.plugin.nvim-tree") -- 文件树
require("jay.plugin.lualine")   -- lualine
require("jay.plugin.telescope") -- fuzzy finder
require("jay.plugin.nvim-cmp") -- 自动补全
-- LSP
require("jay.plugin.lsp.mason") -- LSP
require("jay.plugin.lsp.lspsaga")
-- require("jay.plugin.lsp.lspconfig")
require("jay.plugin.lsp.null-ls")

require("jay.plugin.autopair")
-- require("jay.plugin.tree-sitter")
require("jay.plugin.gitsigns")
require("jay.plugin.bufferline")
require("jay.plugin.feline")
require("jay.plugin.which-key")
-- autocommands
require("jay.plugin.autocommands")
require("jay.plugin.indentline")  -- 缩进竖线
require("jay.plugin.project") -- project是什么
require("jay.plugin.toggleterm")  -- 打开terminal
