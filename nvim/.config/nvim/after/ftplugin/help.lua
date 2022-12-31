vim.o.number = true
vim.o.relativenumber = true

vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | setlocal number<'
vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | setlocal relativenumber<'

vim.keymap.set(
  'n',
  '<CR>',
  '<C-]>',
  { buffer = true, desc = 'jump to tag under cursor' }
)
vim.keymap.set(
  'n',
  '<Esc>',
  '<Cmd>bdelete<CR>',
  { buffer = true, desc = 'close help' }
)
