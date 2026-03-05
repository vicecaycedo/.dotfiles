---@type conform.FiletypeFormatter
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

---@type conform.setupOpts
local opts = {
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
  formatters_by_ft = {
    javascript = prettier,
    lua = { 'stylua' },
    markdown = prettier,
    pgsql = { 'pg_format' },
    python = { 'black' },
    sql = { 'pg_format' },
    swift = { 'swiftformat' },
    yaml = prettier,
  },
}

---@type LazyPluginSpec
return {
  'stevearc/conform.nvim',
  opts = opts,
}
