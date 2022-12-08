local keys = require('which-key')

vim.g.mapleader = ' '
vim.g.camelcasemotion_key = '<leader>'

-- Smart <CR>
vim.keymap.set('n', '<CR>', function()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'nofile' or buftype == 'quickfix' then
    return '<CR>'
  end
  return 'o<Esc>'
end, {
  expr = true,
})

-- Ignore plugin mappings.
keys.register({
  -- camelcasemotion
  ['<leader>b'] = 'which_key_ignore',
  ['<leader>e'] = 'which_key_ignore',
  ['<leader>ge'] = 'which_key_ignore',
  ['<leader>w'] = 'which_key_ignore',
  -- nvim-surround
  ['cs'] = 'which_key_ignore',
  ['cS'] = 'which_key_ignore',
  ['ds'] = 'which_key_ignore',
  ['dS'] = 'which_key_ignore',
  ['ys'] = 'which_key_ignore',
  ['yS'] = 'which_key_ignore',
})

-- Label plugin mappings.
keys.register({
  -- vim-abolish
  ['cr'] = {
    name = 'coerce',
    ['<Space>'] = 'to space case',
    ['.'] = 'to.dot.case',
    ['-'] = 'to-dash-case',
    c = 'toCamelCase',
    m = 'ToMixedCase',
    s = 'to_snake_case',
    u = 'TO_UPPER_SNAKE_CASE',
  },
  -- vim-sort-motion
  ['gs'] = 'sort',
})

-- Register custom mappings.
keys.register({
  ['<Left>'] = { '<Cmd>BufferLineCyclePrev<CR>', 'previous buffer' },
  ['<Right>'] = { '<Cmd>BufferLineCycleNext<CR>', 'next buffer' },
  ['<F6>'] = { require('dap').toggle_breakpoint, 'dap: toggle breakpoint' },
  ['<F7>'] = { require('dap').step_into, 'dap: step into' },
  ['<F8>'] = { require('dap').step_over, 'dap: step over' },
  ['<F9>'] = { require('dap').continue, 'dap: continue' },
  J = { '<Plug>(signify-next-hunk)zz', 'next diff' },
  K = { '<Plug>(signify-prev-hunk)zz', 'prev diff' },
  Q = { require('vc.util').toggle_quickfix, 'toggle quickfix' },
  g = {
    [':'] = { 'q:', "cmdline window ':'" },
    ['/'] = { 'q/', "cmdline window '/'" },
    ['?'] = { 'q?', "cmdline window '?'" },
    H = { vim.lsp.buf.hover, 'show documentation' },
    R = { vim.lsp.buf.rename, 'rename' },
    a = { '<Cmd>Telescope lsp_code_actions<CR>', 'code actions' },
    d = { vim.lsp.buf.definition, 'go to definition' },
    h = { vim.diagnostic.open_float, 'show line diagnostics' },
    r = { vim.lsp.buf.references, 'open references' },
  },
  ['<leader>'] = {
    name = 'leader',
    ['<Left>'] = { '<Cmd>BufferLineMovePrev<CR>', 'move buffer left' },
    ['<Right>'] = { '<Cmd>BufferLineMoveNext<CR>', 'move buffer right' },
    J = { 'J', 'join lines' },
    d = { require('telescope.builtin').diagnostics, 'open buffer diagnostics' },
    j = { '<Cmd>cnext<CR>', 'next quickfix item' },
    k = { '<Cmd>cprev<CR>', 'previous quickfix item' },
    q = { '<Cmd>q<CR>', 'close window' },
    r = { '<Cmd>w<CR><Cmd>source %<CR>', 'source file' },
    s = { '<Cmd>update<CR>', 'save file' },
    x = { '<Cmd>bdelete<CR>', 'close buffer' },
  },
  -- TODO: Unmap <leader>b (created by camelcasemotion) and put the blaze
  -- mappings under <leader>b for easier usage.
  ['<leader>B'] = {
    name = 'blaze',
    b = { require('vc.blaze').test_file, 'test file' },
    f = { require('vc.blaze').test_function, 'test function' },
  },
  ['<leader>c'] = {
    s = { '<Cmd>let @/ = ""<CR>', 'clear search' },
  },
  ['<leader>f'] = {
    name = 'grep file(s)',
    d = { require('vc.grep').grep_dotfiles, 'grep dotfiles' },
    f = { require('telescope.builtin').current_buffer_fuzzy_find, 'grep file' },
    h = { require('telescope.builtin').help_tags, 'grep help tags' },
    p = { require('telescope.builtin').live_grep, 'grep project' },
    s = { '<Cmd>SymbolsOutline<CR>', 'explore symbols' },
    t = { require('telescope.builtin').treesitter, 'grep treesitter' },
  },
  ['<leader>m'] = {
    name = 'version control',
    d = { '<Cmd>SignifyHunkDiff<CR>', 'hunk diff' },
    u = { '<Cmd>SignifyHunkUndo<CR>', 'hunk undo' },
  },
  ['<leader>p'] = {
    name = 'open file',
    d = { require('vc.find').find_dotfiles, 'open dotfile' },
    h = { require('vc.find').find_history, 'open from history' },
    p = { require('vc.find').find_files, 'open file' },
    r = { require('vc.find').find_related, 'open related file' },
  },
  ['<leader>t'] = {
    e = { '<Cmd>NvimTreeToggle<CR>', 'file explorer' },
    f = { '<Cmd>NvimTreeFindFile<CR>', 'find file in file explorer' },
    r = { require('telescope.builtin').resume, 'resume Telescope picker' },
    t = {
      require('vc.util').toggle_strip_trailing_whitespace,
      'toggle StripTrailingWhitespace',
    },
  },
})
