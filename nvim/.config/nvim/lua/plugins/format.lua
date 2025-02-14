local prettier = { 'prettierd', 'prettier', stop_after_first = true }

return {
  'stevearc/conform.nvim',
  opts = {
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
    },
  },
}
