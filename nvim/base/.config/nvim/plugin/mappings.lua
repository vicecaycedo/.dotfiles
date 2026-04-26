local nmap = require('vc.keymap').nmap

nmap('g:', 'q:', "cmdline window ':'")
nmap('g/', 'q/', "cmdline window '/'")
nmap('g?', 'q?', "cmdline window '?'")
nmap('<Leader>cs', '<Cmd>nohlsearch<CR>', 'clear search')
nmap('<Leader>j', '<Cmd>cnext<CR>', 'next quickfix item')
nmap('<Leader>k', '<Cmd>cprevious<CR>', 'previous quickfix item')
nmap('<Leader>h', '<C-w>h', 'move to left window')
nmap('<Leader>l', '<C-w>l', 'move to right window')
nmap('<Leader>q', '<Cmd>quit<CR>', 'close window')
nmap('<Leader>s', '<Cmd>update<CR>', 'save buffer')
nmap(
  '<Leader>S',
  '<Cmd>noautocmd update<CR>',
  'save buffer without autocommands'
)
nmap('<Leader>x', '<Cmd>bdelete<CR>', 'close buffer')

nmap('Q', function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end, 'toggle quickfix')

-- <S-CR> and context-aware <CR>.
nmap('<S-CR>', 'O<Esc>', 'add newline above')
nmap('<CR>', function()
  local buftype = vim.bo.buftype
  if buftype == 'nofile' or buftype == 'quickfix' then
    return '<CR>'
  end
  return 'o<Esc>'
end, 'context-aware <CR>', { expr = true })
