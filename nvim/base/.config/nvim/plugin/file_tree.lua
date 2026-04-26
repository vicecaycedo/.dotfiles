vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/stevearc/oil.nvim',
})

require('oil').setup({
  keymaps = {
    ['<BS>'] = 'actions.parent',
    ['<Esc>'] = 'actions.close',
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return name == '..'
    end,
  },
})

local nmap = require('vc.keymap').nmap
nmap('<Leader>te', '<Cmd>Oil<CR>', 'open file explorer')
