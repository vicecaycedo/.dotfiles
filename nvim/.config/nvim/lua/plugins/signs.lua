return {
  'mhinz/vim-signify',
  init = function()
    vim.g.signify_priority = 5
    vim.g.signify_sign_show_count = 0
  end,
  config = function()
    -- Set keymaps.
    nmap('J', '<Plug>(signify-next-hunk)zz', 'next diff')
    nmap('K', '<Plug>(signify-prev-hunk)zz', 'prev diff')
    nmap('<Leader>md', '<Cmd>SignifyHunkDiff<CR>', 'hunk diff')
    nmap('<Leader>mu', '<Cmd>SignifyHunkUndo<CR>', 'hunk undo')
  end,
}
