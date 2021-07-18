local on_attach = function(client, bufnr)
   if client.resolved_capabilities.document_formatting then
        vim.cmd([[
          aug lsp_format
            au! * <buffer>
            au BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
          aug END
        ]])
    end
end

require('lspconfig').dartls.setup {
  on_attach = on_attach,
  settings = {
    allowAnalytics = false,
    flutterCreateOrganization = 'com.thresholdeng',
    flutterHotReloadOnSave = "always",
  }
}

