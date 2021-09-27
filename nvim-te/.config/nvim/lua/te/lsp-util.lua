local M = {}

M.format_buffer = function()
  vim.lsp.buf.formatting_seq_sync()
end

M.organize_imports = function()
  vim.lsp.buf_request_sync(
    vim.api.nvim_get_current_buf(),
    'workspace/executeCommand',
    {
      command='edit.organizeImports',
      arguments={vim.api.nvim_buf_get_name(0)},
      title='',
    },
    1500
  )
end

return M

