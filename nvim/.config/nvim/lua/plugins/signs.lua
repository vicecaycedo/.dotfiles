return {
  'mhinz/vim-signify',
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
  end,
}
