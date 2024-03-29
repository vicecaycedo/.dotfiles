function _G.nmap(lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set('n', lhs, rhs, opts)
end

nmap('g:', 'q:', "cmdline window ':'")
nmap('g/', 'q/', "cmdline window '/'")
nmap('g?', 'q?', "cmdline window '?'")
nmap('<Leader>cs', '<Cmd>let @/ = ""<CR>', 'Clear search')
nmap('<Leader>j', '<Cmd>cnext<CR>', 'Next quickfix item')
nmap('<Leader>k', '<Cmd>cprevious<CR>', 'Previous quickfix item')
nmap('<Leader>q', '<Cmd>quit<CR>', 'Close window')
nmap('<Leader>s', '<Cmd>update<CR>', 'Save buffer')
nmap('<Leader>L', '<Cmd>Lazy<CR>', 'open Lazy UI')
nmap(
  '<Leader>S',
  '<Cmd>noautocmd update<CR>',
  'Save buffer without autocommands'
)
nmap('<Leader>x', '<Cmd>bdelete<CR>', 'Close buffer')
nmap('<Left>', '<Cmd>bprev<CR>', 'Previous buffer')
nmap('<Right>', '<Cmd>bnext<CR>', 'Next buffer')

nmap('Q', function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end, 'Toggle quickfix')

nmap('<Leader>r', function()
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  if filetype == 'lua' or filetype == 'vim' then
    return '<Cmd>w<CR><Cmd>source %<CR>'
  else
    error('Can not source filetype: ' .. filetype)
  end
end, 'Source lua/vim file', { expr = true })

-- <S-CR> and context-aware <CR>.
nmap('<S-CR>', 'O<Esc>', 'Add newline above')
nmap('<CR>', function()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'nofile' or buftype == 'quickfix' then
    return '<CR>'
  end
  return 'o<Esc>'
end, 'Context-aware <CR>', { expr = true })
