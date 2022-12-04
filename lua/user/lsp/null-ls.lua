local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- local _hover = null_ls.builtins.hover
-- local _completion = null_ls.builtins.completion
-- local _code_actions = null_ls.builtins.code_actions
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local command_resolver = require("null-ls.helpers.command_resolver")

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		dynamic_command = command_resolver.from_node_modules(),
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    formatting.google_java_format,
		formatting.prettierd, -- js/ts formatter
		formatting.clang_format, -- lua formatter
		formatting.cmake_format,
		formatting.reorder_python_imports,
    diagnostics.flake8,
		diagnostics.eslint_d.with({ -- js/ts linter
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
			end,
		}),
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
  },
}
