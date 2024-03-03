return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      lsp_fallback = false,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      pgsql = { 'pg_format' },
      sql = { 'pg_format' },
      swift = { 'swiftformat' },
    },
  },
}
