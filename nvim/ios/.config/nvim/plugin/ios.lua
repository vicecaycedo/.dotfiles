vim.pack.add({
  'https://github.com/folke/snacks.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/wojciech-kulik/xcodebuild.nvim',
})

require('xcodebuild').setup({
  restore_on_start = false,
  previews = {
    open_command = 'edit %s',
  },
  integrations = {
    -- Don't update Xcode project files when using oil.nvim. All project
    -- updates should be through `tuist generate`.
    oil_nvim = {
      enabled = false,
    },
  },
})

local nmap = require('vc.keymap').nmap
nmap('<Leader>rd', '<Cmd>XcodebuildSelectDevice<CR>', 'select device')
nmap('<Leader>rr', '<Cmd>XcodebuildBuildRun<CR>', 'build and run')
nmap(
  '<Leader>rp',
  '<Cmd>XcodebuildPreviewGenerateAndShow<CR>',
  'generate & show preview'
)
nmap('<Leader>rP', '<Cmd>XcodebuildPreviewHide<CR>', 'hide preview')

-- START: AI-generated xcodebuild preview workaround.
-- Workaround for xcodebuild.nvim previews opened with `edit %s`. Snacks
-- renders image buffers through terminal image placements, which can stay
-- painted after switching buffers and can leave the generated PNG marked as
-- modified. These autocmds clean/re-attach the preview image placement and
-- clear the modified flag for `/tmp/xcodebuild.nvim/*.png` buffers.
--
-- This intentionally uses Snacks internals (`snacks.image.placement.clean` and
-- `snacks.image.buf.attach`), so revisit it if Snacks changes its image API.

vim.api.nvim_create_autocmd({ 'BufLeave', 'BufHidden' }, {
  pattern = '/tmp/xcodebuild.nvim/*.png',
  callback = function(ev)
    pcall(require('snacks.image.placement').clean, ev.buf)
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '/tmp/xcodebuild.nvim/*.png',
  callback = function(ev)
    vim.schedule(function()
      if
        vim.api.nvim_buf_is_valid(ev.buf)
        and vim.api.nvim_get_current_buf() == ev.buf
      then
        require('snacks.image.buf').attach(ev.buf)
      end
    end)
  end,
})

vim.api.nvim_create_autocmd('BufModifiedSet', {
  pattern = '/tmp/xcodebuild.nvim/*.png',
  callback = function(ev)
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(ev.buf) then
        vim.bo[ev.buf].modified = false
      end
    end)
  end,
})

-- END: AI-generated xcodebuild preview workaround.
