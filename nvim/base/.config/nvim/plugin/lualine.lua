vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
})

local lualine = require('vc.lualine')

lualine.set_section('lualine_a', { 'mode' })
lualine.set_section('lualine_b', { 'diagnostics' })
lualine.set_section('lualine_c', {
  {
    'filename',
    path = 1, -- Relative path.
  },
})
lualine.set_section('lualine_x', {
  {
    function()
      return require('grapple').name_or_index()
    end,
    cond = function()
      local ok, grapple = pcall(require, 'grapple')
      return ok and grapple.exists()
    end,
  },
})
lualine.set_section('lualine_z', { 'location' })
