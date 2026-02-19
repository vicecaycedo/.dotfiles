require('vc.workspace_files_provider').register({
  match = function()
    return vim.fn.filereadable('Tuist.swift') == 1
  end,
  run = function()
    local include_globs = {
      '*/Sources/**',
      '*/Tests/**',
      '.githooks/**',
      'scripts/**',
      '.gitignore',
      '.mise.toml',
      '.swift-version',
      '.swiftformat',
      'Project.swift',
      'README.md',
      'Tuist.swift',
      'Tuist/Package.swift',
    }
    local args = {}
    for _, glob in ipairs(include_globs) do
      table.insert(args, '-g')
      table.insert(args, glob)
    end

    Snacks.picker.files({
      title = 'Find in iOS source files',
      cmd = 'rg',
      hidden = true,
      args = args,
      exclude = { '**/__Snapshots__/**' },
    })
  end,
})
