vim.o.number = true
vim.o.relativenumber = true

vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | setlocal number<'
vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | setlocal relativenumber<'

-- Use <CR> to jump to the help menu entry for the tag under the cursor.
vim.keymap.set('n', '<CR>', '<C-]>', { buffer = true })

-- Use <Esc> to close the help menu.
vim.keymap.set('n', '<Esc>', '<Cmd>bdelete<CR>', { buffer = true })
