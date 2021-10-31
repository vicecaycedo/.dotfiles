require('flutter-tools').setup({
  dev_tools = {
    auto_open_browser = true,
  },
  lsp = {
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = require('vc.lsp.util').on_attach,
    settings = {
      allowAnalytics = false,
      flutterCreateOrganization = 'com.thresholdeng',
      flutterHotReloadOnSave = 'always',
      showTodos = false,
    },
  },
})
