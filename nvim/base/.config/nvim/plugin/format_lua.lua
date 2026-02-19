require('conform').formatters.stylua = {
  append_args = { '--config-path', vim.fn.stdpath('config') .. '/stylua.toml' },
}
