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

local exclude_globs = {
  '**/__Snapshots__/**',
  '**/__snapshots__/**',
  '**/.DS_Store',
}

local function build_rg_glob_args(includes, excludes)
  local args = {}
  for _, glob in ipairs(includes) do
    table.insert(args, '-g')
    table.insert(args, glob)
  end
  for _, glob in ipairs(excludes) do
    table.insert(args, '-g')
    table.insert(args, '!' .. glob)
  end
  return args
end

local rg_args = build_rg_glob_args(include_globs, exclude_globs)

require('vc.workspace_files_provider').register({
  match = function()
    return vim.fn.filereadable('Tuist.swift') == 1
  end,
  run = function()
    Snacks.picker.files({
      title = 'Find in iOS source files',
      cmd = 'rg',
      hidden = true,
      args = rg_args,
    })
  end,
})
