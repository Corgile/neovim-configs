local notify_ok, notify = pcall(require, "notify")

if not notify_ok then
	return
end

notify.setup({
	stages = "fade_in_slide_out",
	background_colour = "FloatShadow",
	timeout = 3000,
})
vim.notify = require("notify")
