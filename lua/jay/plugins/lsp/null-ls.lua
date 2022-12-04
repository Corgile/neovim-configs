-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- local _hover = null_ls.builtins.hover
-- local _completion = null_ls.builtins.completion
-- local _code_actions = null_ls.builtins.code_actions
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local command_resolver = require("null-ls.helpers.command_resolver")
local _prettier = null_ls.builtins.formatting.prettier.with({
	dynamic_command = command_resolver.from_node_modules(),
})
-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		_prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.prettierd, -- js/ts formatter
		formatting.clang_format, -- lua formatter
		formatting.cmake_format,
		formatting.google_java_format,
		formatting.reorder_python_imports,
		diagnostics.eslint_d.with({ -- js/ts linter
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
			end,
		}),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
						timeout_ms = 2000,
					})
				end,
			})
		end
	end,
	debug = true,
})
