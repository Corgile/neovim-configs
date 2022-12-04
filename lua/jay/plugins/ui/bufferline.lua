local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				-- text = function()
				-- 	return vim.fn.getcwd()
				-- end,
				text_align = "center",
				highlight = "Directory",
				separator = "█",
			},
		},
	},
})
