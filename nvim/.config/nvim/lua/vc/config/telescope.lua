local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup {
  defaults = {
    file_ignore_patterns = { 'packer_compiled.*' },
    layout_config = { prompt_position = 'top' },
    mappings = {
      n = {
        v = actions.file_vsplit,
      },
    },
    sorting_strategy = 'ascending',
  },
  pickers = {
    buffers = { theme = 'ivy' },
    find_files = { theme = 'ivy' },
    oldfiles = { theme = 'ivy' },
  },
}
telescope.load_extension('fzf')

