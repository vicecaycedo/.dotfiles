require('lualine').setup {
  extensions = {
    'nvim-tree',
    'quickfix',
  },
  options = {
    theme = 'vscode',
  },
  sections = {
    lualine_x = {},
    lualine_y = { 'diagnostics' },
  },
}

