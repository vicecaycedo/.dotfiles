---@type conform.FormatterConfigOverride
local stylua = {
  append_args = { '--config-path', vim.fn.stdpath('config') .. '/stylua.toml' },
}

require('conform').formatters.stylua = stylua
