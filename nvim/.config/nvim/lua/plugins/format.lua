return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      pgsql = { 'pg_format' },
      sql = { 'pg_format' },
      swift = { 'swiftformat' },
    },
  },
}
