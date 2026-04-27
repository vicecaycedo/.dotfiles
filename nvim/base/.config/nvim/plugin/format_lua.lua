local conform = require('conform')

conform.formatters_by_ft.lua = { 'stylua' }
conform.formatters.stylua = {
  append_args = {
    '--config-path',
    vim.fn.stdpath('config') .. '/stylua.toml',
  },
}
