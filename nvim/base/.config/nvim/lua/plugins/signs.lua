return {
  'mhinz/vim-signify',
  -- 'lewis6991/gitsigns.nvim',
  init = function()
    vim.g.signify_priority = 5
    vim.g.signify_sign_add = '┃'
    vim.g.signify_sign_change = '┃'
    vim.g.signify_sign_change_delete = '┃'
    vim.g.signify_sign_delete = '┃'
    vim.g.signify_sign_delete_first_line = '┃'
    vim.g.signify_sign_show_count = 0
  end,
  config = function()
    -- Set highlights.
    vim.api.nvim_set_hl(0, 'SignifySignAdd', {
      fg = vim.api.nvim_get_hl(0, { name = 'Comment' }).fg,
      bg = 'NONE',
    })
    vim.api.nvim_set_hl(0, 'SignifySignChange', {
      fg = vim.api.nvim_get_hl(0, { name = 'DiagnosticWarn' }).fg,
      bg = 'NONE',
    })
    vim.api.nvim_set_hl(0, 'SignifySignDelete', {
      fg = vim.api.nvim_get_hl(0, { name = 'DiagnosticError' }).fg,
      bg = 'NONE',
    })
    vim.api.nvim_set_hl(0, 'SignifySignDeleteFirstLine', {
      fg = vim.api.nvim_get_hl(0, { name = 'DiagnosticError' }).fg,
      bg = 'NONE',
    })

    -- Set keymaps.
    nmap('L', '<Plug>(signify-next-hunk)zz', 'next diff')
    nmap('H', '<Plug>(signify-prev-hunk)zz', 'previous diff')
    nmap('<Leader>md', '<Cmd>SignifyHunkDiff<CR>', 'hunk diff')
    nmap('<Leader>mu', '<Cmd>SignifyHunkUndo<CR>', 'hunk undo')
    -- nmap('L', function()
    --   require('gitsigns').nav_hunk('next')
    -- end, 'next diff')
    -- nmap('H', function()
    --   require('gitsigns').nav_hunk('prev')
    -- end, 'previous diff')
    -- nmap('<Leader>md', require('gitsigns').preview_hunk_inline, 'hunk diff')
    -- nmap('<Leader>mu', require('gitsigns').reset_hunk, 'hunk undo')
  end,
}
