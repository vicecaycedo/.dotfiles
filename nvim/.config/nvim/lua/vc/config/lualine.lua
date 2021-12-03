require('lualine').setup({
  extensions = {
    'nvim-tree',
    'quickfix',
    'symbols-outline',
  },
  options = {
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    theme = 'vscode',
  },
  sections = {
    lualine_b = { 'diagnostics' },
    lualine_c = {
      'location',
      {
        'filename',
        path = 1, -- Relative path.
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
