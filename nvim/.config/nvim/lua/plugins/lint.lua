return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    -- Configure SwiftLint.
    -- Based on https://wojciechkulik.pl/ios/the-complete-guide-to-ios-macos-development-in-neovim.
    lint.linters.swiftlint = {
      cmd = 'swiftlint',
      stdin = true,
      args = {
        'lint',
        '--use-stdin',
        '-',
      },
      stream = 'stdout',
      ignore_exitcode = true,
      parser = require('lint.parser').from_pattern(
        '[^:]+:(%d+):(%d+): (%w+): (.+)',
        { 'lnum', 'col', 'severity', 'message' },
        {
          ['error'] = vim.diagnostic.severity.ERROR,
          ['warning'] = vim.diagnostic.severity.WARN,
        },
        { ['source'] = 'swiftlint' }
      ),
    }

    lint.linters_by_ft = {
      swift = { 'swiftlint' },
    }

    vim.api.nvim_create_autocmd(
      { 'BufWritePost', 'BufReadPost', 'InsertLeave', 'TextChanged' },
      {
        group = vim.api.nvim_create_augroup('lint', {}),
        callback = function()
          require('lint').try_lint()
        end,
      }
    )
  end,
}
