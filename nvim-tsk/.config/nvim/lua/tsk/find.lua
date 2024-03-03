local M = {}

M.find_flutter_files = function()
  require('telescope.builtin').find_files({
    prompt_title = 'Find in Flutter Files',
    search_dirs = {
      '.gitignore',
      'analysis_options.yaml',
      'pubspec.yaml',
      'README.md',
      'lib/',
      'test/',
    },
  })
end

return M
