vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

---@type conform.FiletypeFormatter
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

require('conform').setup(
  ---@type conform.setupOpts
  {
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
    formatters = {
      stylua = {
        append_args = {
          '--config-path',
          vim.fn.stdpath('config') .. '/stylua.toml',
        },
      },
    },
  }
)
