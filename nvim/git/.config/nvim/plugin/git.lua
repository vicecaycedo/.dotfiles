vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })

local nmap = require('vc.keymap').nmap
nmap('L', function()
  require('gitsigns').nav_hunk('next')
end, 'next diff')
nmap('H', function()
  require('gitsigns').nav_hunk('prev')
end, 'previous diff')
nmap('<Leader>md', require('gitsigns').preview_hunk_inline, 'hunk diff')
nmap('<Leader>mu', require('gitsigns').reset_hunk, 'hunk undo')
nmap('<Leader>pm', function()
  Snacks.picker.git_status({
    title = 'Find in Modified Files',
  })
end, 'find in modified files')

vim.keymap.set('v', '<Leader>ms', function()
  local start_line = vim.fn.line('.')
  local end_line = vim.fn.line('v')
  require('gitsigns').stage_hunk({
    math.min(start_line, end_line),
    math.max(start_line, end_line),
  })
end, { desc = 'hunk stage' })
