vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/stevearc/oil.nvim',
})

require('oil').setup({
  keymaps = {
    ['<BS>'] = 'actions.parent',
    ['<Esc>'] = 'actions.close',
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return name == '..'
    end,
  },
})

local nmap = require('vc.keymap').nmap
nmap('<Leader>te', '<Cmd>Oil<CR>', 'open file explorer')

-- Automatically close buffers for files deleted through Oil.
vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('oil_delete_buffers', { clear = true }),
  -- Oil emits this User autocmd after filesystem actions. It is not currently
  -- documented in Oil's help, but is used by integrations such as snacks.nvim.
  pattern = 'OilActionsPost',
  callback = function(event)
    if event.data.err then
      return
    end

    for _, action in ipairs(event.data.actions or {}) do
      if action.type == 'delete' then
        local scheme, path = require('oil.util').parse_url(action.url)
        if scheme == 'oil://' and path then
          local deleted_dir_prefix = path:sub(-1) == '/' and path or path .. '/'
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            local name = vim.api.nvim_buf_get_name(bufnr)
            local is_deleted = name == path
            local is_in_deleted_dir = action.entry_type == 'directory'
              and vim.startswith(name, deleted_dir_prefix)

            if is_deleted or is_in_deleted_dir then
              pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
            end
          end
        end
      end
    end
  end,
})
