return {
  -- Extend |gf| support for Lua files.
  { 'sam4llis/nvim-lua-gf', ft = 'lua' },

  -- Add/change/delete surrounding delimiters.
  { 'kylechui/nvim-surround', event = 'VeryLazy', config = true },

  -- Indent objects.
  { 'michaeljsmith/vim-indent-object', event = 'VeryLazy' },
}
