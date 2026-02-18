return {
  'lewis6991/gitsigns.nvim',
  config = function()
    nmap('L', function()
      require('gitsigns').nav_hunk('next')
    end, 'next diff')
    nmap('H', function()
      require('gitsigns').nav_hunk('prev')
    end, 'previous diff')
    nmap('<Leader>md', require('gitsigns').preview_hunk_inline, 'hunk diff')
    nmap('<Leader>mu', require('gitsigns').reset_hunk, 'hunk undo')
  end,
}
