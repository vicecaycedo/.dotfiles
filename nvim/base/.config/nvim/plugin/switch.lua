-- Disable default mapping.
vim.g.switch_mapping = ''

vim.pack.add({ 'https://github.com/andrewradev/switch.vim' })

local nmap = require('vc.keymap').nmap
nmap('<Leader>-', '<Cmd>Switch<CR>', 'switch word under cursor')
