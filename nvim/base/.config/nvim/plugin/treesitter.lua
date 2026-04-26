vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

local parsers = {
  'bash',
  'css',
  'dart',
  'diff',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'go',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'python',
  'sql',
  'svelte',
  'swift',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
  end,
})
