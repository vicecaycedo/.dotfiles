require('vc.find.providers').register({
  match = function()
    return vim.fn.filereadable('Tuist.swift') == 1
  end,
  run = function()
    local search_paths = vim.fn.glob('*/Sources', false, true)
    vim.list_extend(search_paths, vim.fn.glob('*/Tests', false, true))
    vim.list_extend(search_paths, vim.fn.glob('.githooks', false, true))
    vim.list_extend(search_paths, vim.fn.glob('scripts', false, true))
    local additional_paths = {
      '.gitignore',
      '.mise.toml',
      '.swift-version',
      '.swiftformat',
      'Project.swift',
      'README.md',
      'Tuist.swift',
      'Tuist/Package.swift',
    }

    for _, path in ipairs(additional_paths) do
      if vim.fn.filereadable(path) == 1 then
        table.insert(search_paths, path)
      end
    end

    Snacks.picker.files({
      title = 'Find in iOS source files',
      hidden = true,
      dirs = search_paths,
      exclude = { '**/__Snapshots__/**' },
    })
  end,
})
