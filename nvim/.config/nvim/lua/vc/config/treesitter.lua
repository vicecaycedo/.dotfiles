require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'css',
    'dart',
    'go',
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
