local find_dotfiles = function()
  Snacks.picker.files({
    title = 'Find in Dotfiles',
    cwd = vim.fn.stdpath('config'),
    hidden = true,
    follow = true,
  })
end

local find_files = function()
  Snacks.picker.files({
    title = 'Find in Directory',
    hidden = true,
    follow = true,
  })
end

local find_workspace = function()
  ---@type vc.WorkspaceFilesProvider|nil
  local provider = require('vc.workspace_files_provider').pick()
  if provider then
    return provider.run()
  end

  return find_files()
end

local find_related = function()
  ---@type vc.RelatedFilesProvider|nil
  local provider = require('vc.related_files_provider').pick()
  if provider then
    return provider.run()
  end

  return find_workspace()
end

local find_history = function()
  Snacks.picker.recent({
    title = 'Find in Recent',
  })
end

local nmap = require('vc.keymap').nmap
nmap('<Leader>pd', find_dotfiles, 'find in dotfiles')
nmap('<Leader>ph', find_history, 'find in history')
nmap('<Leader>pp', find_workspace, 'find in workspace')
nmap('<Leader>pr', find_related, 'find in related')
nmap('<Leader>pP', find_files, 'find in directory')
