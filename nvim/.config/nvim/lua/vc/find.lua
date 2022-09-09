local M = {}

M.find_dotfiles = function()
  require('telescope.builtin').find_files({
    cwd = vim.fn.stdpath('config'),
    follow = true,
    prompt_title = 'Find in Dotfiles',
  })
end

M.find_files = function()
  require('telescope.builtin').find_files({
    hidden = true,
    prompt_title = 'Find',
  })
end

M.find_history = function()
  require('telescope.builtin').oldfiles({
    prompt_title = 'History',
  })
end

-- Searches for the name of the current file in the file |filename|.
local find_current_filename_in_file = function(filename)
  local lines = vim.fn.readfile(filename)
  local current_filename = vim.fn.expand('%:t')
  for linenum, line in ipairs(lines) do
    if string.match(line, current_filename) then
      return linenum
    end
  end
  return 0
end

-- Returns a table of files related to the current file (e.g. BUILD, tests,
-- etc.). Each entry in the table is a table containing the name of the related
-- file and the relevant line number.
local get_related_files = function()
  local related_files = {}
  local current_dir = vim.fn.expand('%:h')
  local current_filename = vim.fn.expand('%')
  local files_to_find = {
    -- BUILD file.
    current_dir .. '/BUILD',
    -- Source files.
    string.gsub(current_filename, '_test%.(%w+)', '.%1'),
    string.gsub(current_filename, '_tests%.(%w+)', '.%1'),
    -- Test files.
    string.gsub(current_filename, '%.(%w+)', '_test.%1'),
    string.gsub(current_filename, '%.(%w+)', '_tests.%1'),
  }
  for _, filename in ipairs(files_to_find) do
    if filename ~= current_filename and vim.fn.filereadable(filename) == 1 then
      local cwd = vim.fn.getcwd() .. '/'
      local relative_filename = string.gsub(filename, cwd, '')
      -- In BUILD files, search for current file's BUILD rule to jump to that
      -- line directly.
      local lnum = 0
      if string.find(filename, 'BUILD') ~= nil then
        lnum = find_current_filename_in_file(filename)
      end
      table.insert(related_files, {
        filename = relative_filename,
        lnum = lnum,
      })
    end
  end
  return related_files
end

M.find_related = function()
  local action_state = require('telescope.actions.state')
  local action_set = require('telescope.actions.set')
  local config = require('telescope.config').values
  local finders = require('telescope.finders')
  local pickers = require('telescope.pickers')
  local opts = {}
  pickers.new(opts, {
    prompt_title = 'Find in Related Files',
    previewer = config.grep_previewer(opts),
    sorter = config.generic_sorter(opts),
    finder = finders.new_table({
      results = get_related_files(),
      entry_maker = function(entry)
        return {
          value = entry.filename,
          ordinal = entry.filename,
          display = entry.filename,
          lnum = entry.lnum,
        }
      end,
    }),
    attach_mappings = function()
      action_set.select:enhance({
        post = function()
          local selection = action_state.get_selected_entry()
          vim.api.nvim_win_set_cursor(0, { selection.lnum, 0 })
        end,
      })
      return true
    end,
  }):find()
end

return M
