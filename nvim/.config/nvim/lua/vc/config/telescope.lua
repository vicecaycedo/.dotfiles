local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup {
  defaults = {
    file_ignore_patterns = { 'packer_compiled.*' },
    mappings = {
      n = {
        v = actions.file_vsplit,
      },
    },
  },
  pickers = {
    buffers = { theme = 'ivy' },
    find_files = { theme = 'ivy' },
    old_files = { theme = 'ivy' },
  },
}
telescope.load_extension('fzf')

