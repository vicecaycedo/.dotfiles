---@type conform.FiletypeFormatter
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

---@type conform.setupOpts
local opts = {
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 500,
  },
  formatters_by_ft = {
    html = prettier,
    javascript = prettier,
    json = prettier,
    lua = { 'stylua' },
    markdown = prettier,
    pgsql = { 'pg_format' },
    python = { 'black' },
    sql = { 'pg_format' },
    svelte = prettier,
    swift = { 'swiftformat' },
    typescript = prettier,
    yaml = prettier,
  },
}

---@type LazyPluginSpec
return {
  'stevearc/conform.nvim',
  opts = opts,
}
