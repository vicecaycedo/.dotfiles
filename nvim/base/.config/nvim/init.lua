vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.pack.add({
  -- Extend |gf| support for Lua files.
  'https://github.com/sam4llis/nvim-lua-gf',

  -- Add/change/delete surrounding delimiters.
  'https://github.com/kylechui/nvim-surround',

  -- Indent objects.
  'https://github.com/michaeljsmith/vim-indent-object',
})

-- Manage pairs (e.g. parentheses, brackets, etc.) automatically.
vim.pack.add({ 'https://github.com/windwp/nvim-autopairs' })
require('nvim-autopairs').setup({})
