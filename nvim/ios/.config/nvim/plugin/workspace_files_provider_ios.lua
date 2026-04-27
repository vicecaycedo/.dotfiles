---@type fun(item: snacks.picker.finder.Item, picker: snacks.Picker): any
local file_formatter = require('snacks.picker.format').file

---@param path string
---@return string
local function trim_prefix_for_display(path)
  return path:match('^[^/]+/(Sources/.*)$')
    or path:match('^[^/]+/(Tests/.*)$')
    or path
end

---@type string[]
local include_globs = {
  '*/Shared/**',
  '*/Sources/**',
  '*/Tests/**',
  '.githooks/**',
  '.gitignore',
  '.mise.toml',
  '.swift-version',
  '.swiftformat',
  'Project.swift',
  'README.md',
  'Tuist.swift',
  'Tuist/Package.swift',
  'iosrunner.yaml',
  'scripts/**',
}

---@type string[]
local exclude_globs = {
  '**/__Snapshots__/**',
  '**/__snapshots__/**',
  '**/.DS_Store',
}

---@param includes string[]
---@param excludes string[]
---@return string[]
local function build_rg_glob_args(includes, excludes)
  ---@type string[]
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

local function match()
  return vim.fn.filereadable('Tuist.swift') == 1
end

local function run()
  Snacks.picker.files({
    title = 'Find in iOS source files',
    cmd = 'rg',
    hidden = true,
    args = rg_args,
    ---@param item snacks.picker.finder.Item
    ---@return snacks.picker.finder.Item
    transform = function(item)
      if item.file then
        local display_file = trim_prefix_for_display(item.file)
        if display_file ~= item.file then
          item.display_file = display_file
        end
      end
      return item
    end,
    ---@param item snacks.picker.finder.Item
    ---@param picker snacks.Picker
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
end

require('vc.workspace_files_provider').register(
  ---@type vc.WorkspaceFilesProvider
  {
    match = match,
    run = run,
  }
)
