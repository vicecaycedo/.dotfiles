local telescope = require('telescope')
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      -- See: https://www.lua.org/manual/5.1/manual.html#5.4.1 for more
      -- information about lua regex.
      '%.git/',
      'packer_compiled%.lua',
      'packer_compiled%.vim',
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
