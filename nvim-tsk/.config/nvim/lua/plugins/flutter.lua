return {
  'akinsho/flutter-tools.nvim',
  ft = 'dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    lsp = {
      on_attach = require('vc.lsp-util').on_attach,
    },
  },
}
