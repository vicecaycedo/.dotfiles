vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.shortmess:append('c')

vim.pack.add({
  'https://github.com/l3mon4d3/luasnip',
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-cmdline',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/saadparwaiz1/cmp_luasnip',
})

local cmp = require('cmp')
local luasnip = require('luasnip')

-- Set keymaps for Luasnip.
vim.keymap.set({ 'i', 'n', 's' }, '<C-k>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end)
vim.keymap.set({ 'i', 'n', 's' }, '<C-j>', function()
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end)

local menu_from_source_name = {
  buffer = 'Buf',
  luasnip = 'Snip',
  nvim_lsp = 'LSP',
}

-- Set up nvim-cmp.
cmp.setup(
  ---@type cmp.ConfigSchema
  {
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = menu_from_source_name[entry.source.name]
        return vim_item
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item({
        behavior = cmp.SelectBehavior.Insert,
      }),
      ['<C-n>'] = cmp.mapping.select_next_item({
        behavior = cmp.SelectBehavior.Insert,
      }),
      ['<CR>'] = cmp.mapping.confirm(),
    },
    preselect = cmp.PreselectMode.None,
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer', max_item_count = 5 },
    },
  }
)

cmp.setup.cmdline(
  ':',
  ---@type cmp.ConfigSchema
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'cmdline', max_item_count = 10 },
    },
  }
)

cmp.setup.cmdline(
  '/',
  ---@type cmp.ConfigSchema
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer', max_item_count = 10 },
    },
  }
)
