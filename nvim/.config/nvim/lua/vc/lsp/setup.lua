-- Configure how diagnostics are displayed.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

local on_attach = function(client)
  local capabilities = client.resolved_capabilities

  -- Autoformat on save, if available.
  if capabilities.document_formatting then
    vim.cmd(
      [[
      aug lsp_format
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp.util').format_buffer()
      aug END
    ]])
  end

  -- Organize imports, if available.
  if capabilities.code_action and capabilities.code_action.codeActionKinds and
    capabilities.code_action.codeActionKinds['source.organizeImports'] then
    vim.cmd(
      [[
      aug lsp_organize_imports
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp.util').organize_imports()
      aug END
    ]])
  end
end

-- Set up language servers installed through nvim-lspinstall.
--   `:LspInstall <server>`
-- My supported languages:
--   lua
local lsp_install = require('lspinstall')
local lsp_config = require('lspconfig')
lsp_install.setup()
local servers = lsp_install.installed_servers()
for _, server in pairs(servers) do
  local config = { on_attach = on_attach }
  if server == 'lua' then
    config.settings = require('vc.lsp.settings').lua
  end
  lsp_config[server].setup(config)
end

-- Set up EFM language server.
require'lspconfig'.efm.setup {
  filetypes = { 'lua' },
  init_options = { documentFormatting = true },
  on_attach = on_attach,
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      lua = { { formatCommand = 'lua-format -i', formatStdin = true } },
    },
  },
}

