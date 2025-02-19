-- Global cmp source to menu name map so that external configs can update it.
vim.g.cmp_source_to_menu = {
  buffer = 'Buf',
  luasnip = 'Snip',
  nvim_lsp = 'LSP',
  nvim_lua = 'Lua',
}

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    'l3mon4d3/luasnip',
  },
  event = 'InsertEnter',
  config = function()
    vim.o.completeopt = 'menuone,noselect'
    vim.o.shortmess = vim.o.shortmess .. 'c'

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- Set up Luasnip.
    luasnip.config.set_config({
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      delete_check_events = 'TextChanged',
    })
    require('vc.snippets')
    pcall(require, 'tsk.snippets')
    pcall(require, 'google.snippets')

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
    vim.keymap.set({ 'i', 's' }, '<Tab>', function()
      if luasnip.choice_active() then
        return '<Plug>luasnip-next-choice'
      else
        return '<Tab>'
      end
    end, {
      expr = true,
    })

    -- Set up nvim-cmp.
    cmp.setup({
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = vim.g.cmp_source_to_menu[entry.source.name]
          local length_limit = 60
          if string.len(vim_item.abbr) > length_limit then
            vim_item.abbr = string.sub(vim_item.abbr, 1, length_limit) .. '...'
          end
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
        { name = 'nvim_lua' },
        { name = 'buffer', max_item_count = 5 },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline', max_item_count = 10 },
      },
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer', max_item_count = 10 },
      },
    })
  end,
}
