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
      component_separators = '',
      section_separators = '',
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
