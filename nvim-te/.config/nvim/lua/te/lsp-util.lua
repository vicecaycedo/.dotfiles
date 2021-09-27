local M = {}

M.format_buffer = function()
  vim.lsp.buf.formatting_seq_sync()
end

return M

