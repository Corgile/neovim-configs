local mason_ok, mason = pcall(require, "mason")

if not mason_ok then return end

local mason_config_ok, mason_config = pcall(require, "mason-lspconfig")
if not mason_config_ok then return end

mason.setup({

})

mason_config.setup({
    ensure_installed = {
        "html",
        "cssls",
        "sumneko_lua",
        "clangd"
    }
})
