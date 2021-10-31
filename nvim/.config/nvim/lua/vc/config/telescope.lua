local telescope = require('telescope')
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      '.git/',
      'packer_compiled.*',
    },
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      n = {
        v = 'file_vsplit',
      },
    },
    sorting_strategy = 'ascending',
  },
  pickers = {
    buffers = { theme = 'ivy' },
    find_files = { theme = 'ivy' },
    lsp_code_actions = { theme = 'cursor' },
    oldfiles = { theme = 'ivy' },
  },
})
telescope.load_extension('fzf')
