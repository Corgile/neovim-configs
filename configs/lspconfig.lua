local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local _lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "clangd",
}

for _, lsp in ipairs(servers) do
  _lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
