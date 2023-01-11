return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  opts = {
    extensions = {
      'nvim-dap-ui',
      'nvim-tree',
      'quickfix',
      'symbols-outline',
    },
    options = {
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_b = { 'diagnostics' },
      lualine_c = {
        {
          'filename',
          path = 1, -- Relative path.
        },
      },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = { 'progress' },
    },
  },
}
