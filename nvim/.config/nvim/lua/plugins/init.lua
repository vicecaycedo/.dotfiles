return {
  -- Extend |gf| support for Lua files.
  { 'sam4llis/nvim-lua-gf', ft = 'lua' },

  -- Add/change/delete surrounding delimiters.
  { 'kylechui/nvim-surround', event = 'VeryLazy', config = true },

  -- Autoclose and autorename HTML tags.
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html' },
    config = true,
  },

  -- Indent objects.
  { 'michaeljsmith/vim-indent-object', event = 'VeryLazy' },
}
