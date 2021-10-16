require('flutter-tools').setup({
  dev_tools = {
    auto_open_browser = true,
  },
  lsp = {
    on_attach = require('vc.lsp.util').on_attach,
    settings = {
      allowAnalytics = false,
      flutterCreateOrganization = 'com.thresholdeng',
      flutterHotReloadOnSave = 'always',
      showTodos = false,
    },
  },
})
