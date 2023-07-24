return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    extensions = {
      'nvim-dap-ui',
      'nvim-tree',
      'quickfix',
      'symbols-outline',
    },
    options = {
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'diagnostics' },
      lualine_c = {
        {
          'buffers',
          symbols = {
            alternate_file = '',
          },
        },
      },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = { 'progress' },
    },
  },
}
