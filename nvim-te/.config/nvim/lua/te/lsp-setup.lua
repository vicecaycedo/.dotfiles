-- Supported language servers:
--   Manually installed:
--     dart (bundled with Flutter)
--   Through nvim-lspinstall (`:LspInstall <server>`):
--     angular, bash, css, html, json, lua, python, vim, yaml

-- TODO: Refactor now that LSP has been moved to core (vc).

-- Configure how diagnostics are displayed.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
  })

local on_attach = function(client)
  -- Autoformat on save, if available.
  if client.resolved_capabilities.document_formatting then
    vim.cmd(
      [[
      aug lsp_format
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp-util').format_buffer()
      aug END
    ]])
  end

  -- Organize imports, if available.
  local code_actions = client.resolved_capabilities.code_action.codeActionKinds
  if _G.has(code_actions, 'source.organizeImports') then
    vim.cmd(
      [[
      aug lsp_organize_imports
        au! * <buffer>
        au BufWritePre <buffer> lua require('vc.lsp-util').organize_imports()
      aug END
    ]])
  end
end

-- Manage Flutter LSP separately.
require('flutter-tools').setup {
  dev_tools = {
    auto_open_browser = true,
  },
  lsp = {
    on_attach = on_attach,
    settings = {
      allowAnalytics = false,
      flutterCreateOrganization = 'com.thresholdeng',
      flutterHotReloadOnSave = 'always',
      showTodos = false,
    },
  },
}

