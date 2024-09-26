return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    extensions = {
      'nvim-dap-ui',
      'oil',
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
          function()
            return require('grapple').name_or_index()
          end,
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
