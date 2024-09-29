local M = {}

M.find_flutter_files = function()
  require('telescope.builtin').find_files({
    prompt_title = 'find in flutter files',
    search_dirs = {
      '.gitignore',
      'analysis_options.yaml',
      'pubspec.yaml',
      'README.md',
      'lib/',
      'test/',
    },
    file_ignore_patterns = {
      '%.g.dart',
    },
  })
end

return M
