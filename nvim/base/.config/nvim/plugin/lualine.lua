vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
})

require('lualine').setup({
  extensions = {
    'oil',
    'quickfix',
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
        cond = function()
          local ok, grapple = pcall(require, 'grapple')
          return ok and grapple.exists()
        end,
      },
    },
    lualine_y = {},
    lualine_z = { 'location' },
  },
})
