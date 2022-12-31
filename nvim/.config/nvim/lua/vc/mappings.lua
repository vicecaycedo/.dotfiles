function _G.nmap(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

nmap('Q', require('vc.util').toggle_quickfix, 'toggle quickfix')
nmap('g:', 'q:', "cmdline window ':'")
nmap('g/', 'q/', "cmdline window '/'")
nmap('g?', 'q?', "cmdline window '?'")
nmap('<Leader>Bb', require('vc.blaze').test_file, 'test file')
nmap('<Leader>Bf', require('vc.blaze').test_function, 'test function')
nmap('<Leader>J', 'J', 'join lines')
nmap('<Leader>cs', '<Cmd>let @/ = ""<CR>', 'clear search')
nmap('<Leader>j', '<Cmd>cnext<CR>', 'next quickfix item')
nmap('<Leader>k', '<Cmd>cprev<CR>', 'previous quickfix item')
nmap('<Leader>q', '<Cmd>q<CR>', 'close window')
nmap('<Leader>s', '<Cmd>update<CR>', 'save buffer')
nmap('<Leader>x', '<Cmd>bdelete<CR>', 'close buffer')

-- TODO: Add check to make sure the file is a Lua or VimL file before sourcing.
nmap('<Leader>r', '<Cmd>w<CR><Cmd>source %<CR>', 'source file')

-- Smart <CR>
vim.keymap.set('n', '<CR>', function()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'nofile' or buftype == 'quickfix' then
    return '<CR>'
  end
  return 'o<Esc>'
end, {
  expr = true,
})
