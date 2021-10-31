local cmp = require('cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match('%s')
      == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(key, true, true, true),
    mode,
    true
  )
end

local smart_tab = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.fn['vsnip#available']() == 1 then
    feedkey('<Plug>(vsnip-expand-or-jump)', '')
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local smart_s_tab = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
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
    -- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings.
    ['<Tab>'] = smart_tab,
    ['<S-Tab>'] = smart_s_tab,
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'vsnip' },
    { name = 'nvim_lsp' },
    -- { name = 'buffer' },
    { name = 'nvim_lua' },
  },
})
