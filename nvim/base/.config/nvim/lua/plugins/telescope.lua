return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  cmd = 'Telescope',
  keys = {
    -- Telescope.
    {
      '<Leader>tr',
      '<Cmd>Telescope resume<CR>',
      desc = 'resume telescope picker',
    },
    -- Diagnostics.
    {
      '<Leader>d',
      '<Cmd>Telescope diagnostics<CR>',
      desc = 'open buffer diagnostics',
    },
    -- Files.
    { '<Leader>pd', require('vc.find').dotfiles, desc = 'open from dotfiles' },
    { '<Leader>ph', require('vc.find').history, desc = 'open from history' },
    { '<Leader>pp', require('vc.find').files, desc = 'open from directory' },
    -- grep.
    { '<Leader>fb', require('vc.grep').buffer, desc = 'grep buffer' },
    { '<Leader>fd', require('vc.grep').dotfiles, desc = 'grep dotfiles' },
    { '<Leader>ff', require('vc.grep').dir, desc = 'grep directory' },
    { '<Leader>fh', require('vc.grep').help, desc = 'grep help tags' },
    { '<Leader>ft', '<Cmd>Telescope treesitter<CR>', desc = 'grep treesitter' },
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
        layout_strategy = 'vertical',
        sorting_strategy = 'ascending',
        layout_config = {
          vertical = {
            prompt_position = 'top',
            mirror = true,
            width = 200,
          },
        },
        mappings = {
          n = {
            p = require('telescope.actions.layout').toggle_preview,
          },
        },
      },
    })
    telescope.load_extension('fzf')
  end,
}
