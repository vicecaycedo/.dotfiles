local file_formatter = require('snacks.picker.format').file

local function trim_prefix_for_display(path)
  return path:match('^[^/]+/(Sources/.*)$')
    or path:match('^[^/]+/(Tests/.*)$')
    or path
end

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
      transform = function(item)
        if item.file then
          local display_file = trim_prefix_for_display(item.file)
          if display_file ~= item.file then
            item.display_file = display_file
          end
        end
        return item
      end,
      format = function(item, picker)
        if not item.display_file then
          return file_formatter(item, picker)
        end
        local display_item = vim.tbl_extend('force', {}, item, {
          file = item.display_file,
        })
        return file_formatter(display_item, picker)
      end,
    })
  end,
})
