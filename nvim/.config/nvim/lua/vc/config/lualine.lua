require('lualine').setup {
  extensions = { 'nvim-tree', 'quickfix' },
  options = {
    theme = 'vscode',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1, -- Relative path.
      },
    },
    lualine_x = {},
    lualine_y = { 'diagnostics' },
  },
}

