local packer = require('packer')
local use = packer.use

-- Flutter support.
use({
  'akinsho/flutter-tools.nvim',
  requires = 'nvim-lua/plenary.nvim',
  ft = { 'dart' },
  config = function()
    require('te.config.flutter-tools')
  end,
})
