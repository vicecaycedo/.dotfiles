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
      json = prettier,
      markdown = prettier,
      yaml = prettier,
    },
  }
)
