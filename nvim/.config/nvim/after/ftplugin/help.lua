vim.opt_local.number = true
vim.opt_local.relativenumber = true

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
