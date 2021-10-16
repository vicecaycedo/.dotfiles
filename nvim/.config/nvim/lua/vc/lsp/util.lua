local M = {}

M.format_buffer = function()
  vim.lsp.buf.formatting_seq_sync()
end

M.organize_imports = function()
  vim.lsp.buf_request_sync(
    vim.api.nvim_get_current_buf(),
    'workspace/executeCommand',
    {
      command = 'edit.organizeImports',
      arguments = { vim.api.nvim_buf_get_name(0) },
      title = '',
    },
    1500
  )
end

M.on_attach = function(client)
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

return M
