local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup {
  defaults = {
    file_ignore_patterns = { 'packer_compiled.*' },
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      i = {
        -- ['<Esc>'] = actions.close,
      },
      n = {
        v = actions.file_vsplit,
      },
    },
    sorting_strategy = 'ascending',
  },
}
telescope.load_extension('fzf')

