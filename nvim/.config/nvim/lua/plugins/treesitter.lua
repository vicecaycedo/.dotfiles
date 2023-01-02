return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'css',
          'dart',
          'go',
          'help',
          'html',
          'json',
          'kotlin',
          'lua',
          'python',
          'query',
          'vim',
          'yaml',
        },
        highlight = { enable = true },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { 'BufWrite', 'CursorHold' },
        },
      })
    end,
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
  },
}
