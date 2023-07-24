return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  cmd = 'Telescope',
  keys = {
    {
      '<Leader>d',
      '<Cmd>Telescope diagnostics<CR>',
      desc = 'Open buffer diagnostics',
    },

    { '<Leader>fb', require('vc.grep').grep_buffer, desc = 'grep buffer' },
    { '<Leader>fd', require('vc.grep').grep_dotfiles, desc = 'grep dotfiles' },
    { '<Leader>fh', require('vc.grep').grep_help, desc = 'grep help tags' },
    { '<Leader>fp', require('vc.grep').grep_dir, desc = 'grep directory' },
    { '<Leader>ft', '<Cmd>Telescope treesitter<CR>', desc = 'grep treesitter' },

    {
      '<Leader>pd',
      require('vc.find').find_dotfiles,
      desc = 'Open from dotfiles',
    },
    {
      '<Leader>ph',
      require('vc.find').find_history,
      desc = 'Open from history',
    },
    {
      '<Leader>pp',
      require('vc.find').find_files,
      desc = 'Open from directory',
    },
    {
      '<Leader>pr',
      require('vc.find').find_related,
      desc = 'Open from related files',
    },

    {
      '<Leader>tr',
      '<Cmd>Telescope resume<CR>',
      desc = 'Resume Telescope picker',
    },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          -- See: https://www.lua.org/manual/5.1/manual.html#5.4.1 for more
          -- information about lua regex.
          '%.git/',
          '%.orig',
        },
        layout_config = {
          prompt_position = 'top',
          horizontal = { height = 0.95, width = 0.95 },
        },
        mappings = {
          n = {
            p = require('telescope.actions.layout').toggle_preview,
          },
        },
        sorting_strategy = 'ascending',
      },
      pickers = {
        lsp_code_actions = { theme = 'cursor' },
      },
    })
    telescope.load_extension('fzf')
  end,
}
