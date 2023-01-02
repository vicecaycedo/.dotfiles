return {
  'mhinz/vim-signify',
  init = function()
    vim.g.signify_priority = 5
    vim.g.signify_sign_show_count = 0
  end,
  config = function()
    -- Set keymaps.
    nmap('L', '<Plug>(signify-next-hunk)zz', 'Next diff')
    nmap('H', '<Plug>(signify-prev-hunk)zz', 'Previous diff')
    nmap('<Leader>md', '<Cmd>SignifyHunkDiff<CR>', 'Hunk diff')
    nmap('<Leader>mu', '<Cmd>SignifyHunkUndo<CR>', 'Hunk undo')
  end,
}
