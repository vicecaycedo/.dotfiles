return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'dart',
        'diff',
        'dot',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'go',
        'html',
        'java',
        'javascript',
        'json',
        'jsonc',
        'kotlin',
        'lua',
        'markdown',
        'markdown_inline',
        'proto',
        'python',
        'query',
        'scss',
        'sql',
        'starlark',
        'swift',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },
      highlight = { enable = true },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { 'BufWrite', 'CursorHold' },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
  },
}
