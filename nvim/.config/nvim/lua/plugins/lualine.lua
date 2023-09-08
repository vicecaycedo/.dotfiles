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
          'filename',
          path = 1, -- Relative path.
        },
      },
      lualine_x = {
        {
          require('grapple').key,
          cond = require('grapple').exists,
        },
        {
          'buffers',
          symbols = {
            alternate_file = '',
          },
        },
      },
      lualine_y = { 'location' },
      lualine_z = { 'progress' },
    },
  },
}
