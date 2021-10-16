-- Configure how diagnostics are displayed.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
  }
)

local on_attach = function(client)
  local capabilities = client.resolved_capabilities

  -- Autoformat on save, if available.
  if capabilities.document_formatting then
    vim.cmd([[
      aug lsp_format
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp.util').format_buffer()
      aug END
    ]])
  end

  -- Organize imports, if available.
  local organize_imports_available = capabilities.code_action
    and type(capabilities.code_action) == 'table'
    and capabilities.code_action.codeActionKinds
    and capabilities.code_action.codeActionKinds['source.organizeImports']
  if organize_imports_available then
    vim.cmd([[
      aug lsp_organize_imports
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp.util').organize_imports()
      aug END
    ]])
  end
end

-- Set up language servers installed through nvim-lsp-installer.
--   `:LspInstall <server>`
-- My supported language servers:
--   sumneko_lua (lua)
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
  }

  if server == 'lua' then
    opts.settings = require('vc.lsp.settings').lua
  end

  -- This setup() function is exactly the same as lspconfig's setup function
  -- (:help lspconfig-quickstart)
  server:setup(opts)
  vim.cmd('do User LspAttachBuffers')
end)

-- Set up null-ls (general purpose language server).
local lsp_config = require('lspconfig')
local null_ls = require('null-ls')
null_ls.config({
  sources = {
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        '--config-path',
        vim.fn.expand('~/.config/stylua/stylua.toml'),
      },
    }),
  },
})
lsp_config['null-ls'].setup({
  on_attach = on_attach,
})
