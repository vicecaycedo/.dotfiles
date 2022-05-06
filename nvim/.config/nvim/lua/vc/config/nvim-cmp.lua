local cmp = require('cmp')

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(key, true, true, true),
    mode,
    true
  )
end

local smart_tab = function(fallback)
  if vim.fn['vsnip#available'](1) == 1 then
    feedkey('<Plug>(vsnip-expand-or-jump)', '')
  else
    fallback()
  end
end

local smart_s_tab = function(fallback)
  if vim.fn['vsnip#jumpable'](-1) == 1 then
    feedkey('<Plug>(vsnip-jump-prev)', '')
  else
    fallback()
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    -- Inspired by: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings.
    ['<Tab>'] = smart_tab,
    ['<S-Tab>'] = smart_s_tab,
    ['<CR>'] = cmp.mapping.confirm(),
  },
  sources = {
    { name = 'vsnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer', max_item_count = 5 },
    { name = 'nvim_lua' },
  },
})

cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline', max_item_count = 20 },
  },
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', max_item_count = 20 },
  },
})
