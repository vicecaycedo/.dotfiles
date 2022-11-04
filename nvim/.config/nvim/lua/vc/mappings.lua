vim.g.mapleader = ' '
vim.g.camelcasemotion_key = '<leader>'

-- Smart <CR>.
vim.keymap.set('n', '<CR>', function()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'nofile' or buftype == 'quickfix' then
    return '<CR>'
  end
  return 'o<Esc>'
end, {
  expr = true,
})

require('which-key').register({
  ['<Left>'] = { '<Cmd>BufferLineCyclePrev<CR>', 'previous buffer' },
  ['<Right>'] = { '<Cmd>BufferLineCycleNext<CR>', 'next buffer' },
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
    d = {
      '<Cmd>Telescope diagnostics bufnr=0<CR>',
      'open buffer diagnostics',
    },
    j = { '<Cmd>cnext<CR>', 'next quickfix item' },
    k = { '<Cmd>cprev<CR>', 'previous quickfix item' },
    q = { '<Cmd>q<CR>', 'close window' },
    r = { '<Cmd>w<CR><Cmd>source %<CR>', 'source file' },
    s = { '<Cmd>update<CR>', 'save file' },
    x = { '<Cmd>bdelete<CR>', 'close buffer' },
  },
  ['<leader>c'] = {
    s = { '<Cmd>let @/ = ""<CR>', 'clear search' },
  },
  ['<leader>f'] = {
    name = 'grep file(s)',
    d = { require('vc.grep').grep_dotfiles, 'grep dotfiles' },
    f = { '<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'grep file' },
    h = { '<Cmd>Telescope help_tags<CR>', 'grep help tags' },
    p = { '<Cmd>Telescope live_grep<CR>', 'grep project' },
    s = { '<Cmd>SymbolsOutline<CR>', 'explore symbols' },
    t = { '<Cmd>Telescope treesitter<CR>', 'grep treesitter' },
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
    r = { '<Cmd>Telescope resume<CR>', 'resume Telescope picker' },
    t = {
      require('vc.util').toggle_strip_trailing_whitespace,
      'toggle StripTrailingWhitespace',
    },
  },
})
