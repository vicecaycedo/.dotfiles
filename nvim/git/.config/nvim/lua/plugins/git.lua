---@type LazyPluginSpec
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
    vim.keymap.set('v', '<Leader>ms', function()
      local start_line = vim.fn.line('.')
      local end_line = vim.fn.line('v')
      require('gitsigns').stage_hunk({ math.min(start_line, end_line), math.max(start_line, end_line) })
    end, { desc = 'hunk stage' })
  end,
}
