-- Set up language servers installed through nvim-lsp-installer.
--   `:LspInstall <server>`
-- My supported language servers:
--   sumneko_lua (lua)
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = require('vc.lsp.util').on_attach,
  }

  if server.name == 'sumneko_lua' then
    opts.settings = require('vc.lsp.settings').lua
  end

  -- This setup() function is exactly the same as lspconfig's setup function
  -- (:help lspconfig-quickstart)
  server:setup(opts)
  vim.cmd('do User LspAttachBuffers')
end)

-- Set up null-ls (general purpose language server).
local null_ls = require('null-ls')
null_ls.setup({
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = require('vc.lsp.util').on_attach,
  sources = {
    -- Lua formatter.
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        '--config-path',
        vim.fn.expand('~/.config/stylua/stylua.toml'),
      },
    }),
  },
})

-- Configure how diagnostics are displayed.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
  }
)
