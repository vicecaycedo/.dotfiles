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
    lsp_code_actions = { theme = 'cursor' },
  },
})
telescope.load_extension('fzf')
