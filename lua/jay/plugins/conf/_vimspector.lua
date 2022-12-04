local _ok, vimspector = pcall(require, "vimspector")

if not _ok then
	return
end

vimspector.setup()
