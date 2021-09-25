local keys = require('which-key')

keys.register {
  ['<leader>'] = {
    F = {
      [[<Cmd>Telescope flutter commands<CR>]],
      'flutter',
    },
  }
}
