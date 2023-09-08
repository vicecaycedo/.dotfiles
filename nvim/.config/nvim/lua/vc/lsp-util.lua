local M = {}

M.on_attach = function(client)
  -- Autoformat on save if formatting is available.
  local capabilities = client.server_capabilities
  if capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('lsp_format', {}),
      callback = function()
        local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
        -- Do not autoformat Python files since the formatter is very slow.
        if filetype ~= 'python' then
          vim.lsp.buf.format({
            filter = function(formatting_client)
              return formatting_client.name ~= 'html'
                and formatting_client.name ~= 'lua_ls'
            end,
          })
        end
      end,
    })
  end

  -- Reset |formatexpr| to preserve |gq| behavior.
  vim.o.formatexpr = ''
end

return M
