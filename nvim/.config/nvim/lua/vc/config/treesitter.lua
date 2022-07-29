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
    'vim',
    'yaml',
  },
  highlight = { enable = true },
})
