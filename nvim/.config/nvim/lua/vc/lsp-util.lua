local M = {}

M.on_attach = function(client)
  -- Autoformat on save if formatting is available.
  local capabilities = client.server_capabilities
  if capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('lsp_format', {}),
      callback = function()
        vim.lsp.buf.format({
          filter = function(formatting_client)
            return formatting_client.name ~= 'html'
          end,
        })
      end,
    })
  end
end

return M
