local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.bashls.setup({ capabilities = default_capabilities })

lspconfig.cssls.setup({ capabilities = default_capabilities })

lspconfig.gopls.setup({ capabilities = default_capabilities })

lspconfig.html.setup({ capabilities = default_capabilities })
