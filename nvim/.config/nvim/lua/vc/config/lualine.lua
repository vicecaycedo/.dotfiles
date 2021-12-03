require('lualine').setup({
  extensions = {
    'nvim-tree',
    'quickfix',
  },
  options = {
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    theme = 'vscode',
  },
  sections = {
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 1, -- Relative path.
      },
    },
    lualine_x = {},
    lualine_y = { 'diagnostics' },
  },
})
