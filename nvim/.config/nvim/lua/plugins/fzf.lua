return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = 'FzfLua',
  keys = {
    -- fzf.
    { '<Leader>fr', '<Cmd>FzfLua resume<CR>', desc = 'resume fzf picker' },

    -- Diagnostics.
    {
      '<Leader>d',
      '<Cmd>FzfLua diagnostics_document<CR>',
      desc = 'open buffer diagnostics',
    },

    -- grep.
    { '<Leader>fb', '<Cmd>FzfLua lgrep_curbuf<CR>', desc = 'grep buffer' },
    { '<Leader>fd', require('vc.grep').dotfiles, desc = 'grep dotfiles' },
    { '<Leader>fh', '<Cmd>FzfLua helptags<CR>', desc = 'grep help tags' },
    { '<Leader>fp', '<Cmd>FzfLua live_grep<CR>', desc = 'grep directory' },
    { '<Leader>ft', '<Cmd>FzfLua treesitter<CR>', desc = 'grep treesitter' },

    -- Files.
    { '<Leader>pd', require('vc.find').dotfiles, desc = 'open from dotfiles' },
    { '<Leader>ph', '<Cmd>FzfLua oldfiles<CR>', desc = 'open from history' },
    { '<Leader>pp', require('vc.find').files, desc = 'open from directory' },
  },
  opts = {
    grep = {
      rg_opts = table.concat({
        '--follow',
        '--hidden',
        '--column',
        [[-g '!{.git}/']],
        '--line-number',
        '--no-heading',
        '--color=always',
        '--smart-case',
        '--max-columns=4096',
        '-e',
      }, ' '),
    },
    oldfiles = {
      include_current_session = true,
    },
    winopts = {
      width = 200,
      preview = {
        layout = 'vertical',
      },
    },
  },
}
