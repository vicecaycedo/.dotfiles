local M = {}

--- Returns a table with the elements in |table_one| and |table_two|.
local concatenate_tables = function(table_one, table_two)
  local result = {}
  for _, value in ipairs(table_one) do
    table.insert(result, value)
  end
  for _, value in ipairs(table_two) do
    table.insert(result, value)
  end
  return result
end

--- Searches for |text| in |file| and returns the first line number where
--- it is found, or nil if it is not found.
local find_lnum_for_text_in_file = function(text, file)
  local lines = vim.fn.readfile(file)
  for linenum, line in ipairs(lines) do
    if string.match(line, text) then
      return linenum
    end
  end
  return nil
end

local get_build_files = function()
  local results = {}
  local filename = vim.fn.expand('%')
  local filename_tail = vim.fn.expand('%:t')
  local build_files = vim.fs.find('BUILD', { path = filename, upward = true })
  for _, build_file in ipairs(build_files) do
    if build_file ~= filename then
      local lnum = find_lnum_for_text_in_file(filename_tail, build_file)
      table.insert(results, { name = build_file, lnum = lnum })
    end
  end
  return results
end

local filter_for_only_real_files = function(files_to_check)
  local results = {}
  local filename = vim.fn.expand('%')
  for _, file_to_check in ipairs(files_to_check) do
    if
      file_to_check ~= filename and vim.fn.filereadable(file_to_check) == 1
    then
      table.insert(results, { name = file_to_check })
    end
  end
  return results
end

local get_files_for_go_or_python = function()
  local filename = vim.fn.expand('%')
  local files_to_check = {
    -- Source files (if the current file is a test file).
    string.gsub(filename, '_test%.(.+)', '.%1'),
    string.gsub(filename, '_tests%.(.+)', '.%1'),
    -- Test files (if the current file is a source file).
    string.gsub(filename, '%.(.+)', '_test.%1'),
    string.gsub(filename, '%.(.+)', '_tests.%1'),
  }
  return filter_for_only_real_files(files_to_check)
end

local get_files_for_acx = function()
  local filename = vim.fn.expand('%')
  local parent_dir = vim.fs.dirname(filename)
  local grandparent_dir = vim.fs.dirname(parent_dir)
  local greatgrandparent_dir = vim.fs.dirname(grandparent_dir)

  -- Only interested in the filename tail with extension(s) removed. Removing
  -- two extensions to support `.acx.html` files.
  local root_name = vim.fn.expand('%:t:r:r')
  -- Remove `_test` suffix.
  root_name = string.gsub(root_name, '_test', '')
  -- Remove `_po` suffix.
  root_name = string.gsub(root_name, '_po', '')

  -- stylua: ignore start
  local files_to_check = {
    -- Source files.
    grandparent_dir .. '/lib/' .. root_name .. '.dart',
    greatgrandparent_dir .. '/lib/' .. root_name .. '.dart',
    grandparent_dir .. '/lib/' .. root_name .. '.acx.html',
    greatgrandparent_dir .. '/lib/' .. root_name .. '.acx.html',
    grandparent_dir .. '/lib/' .. root_name .. '.scss',
    greatgrandparent_dir .. '/lib/' .. root_name .. '.scss',
    -- Test files.
    grandparent_dir .. '/test/' .. root_name .. '_test.dart',
    greatgrandparent_dir .. '/test/' .. root_name .. '_test.dart',
    -- Testing files.
    grandparent_dir .. '/testing/lib/' .. root_name .. '_po.dart',
    greatgrandparent_dir .. '/testing/lib/' .. root_name .. '_po.dart',
  }
  -- stylua: ignore end
  return filter_for_only_real_files(files_to_check)
end

local get_files_for_java = function()
  local filename = vim.fn.expand('%')
  local filename_with_java_prefix = string.gsub(filename, 'javatests/', 'java/')
  local filename_with_javatests_prefix =
    string.gsub(filename, 'java/', 'javatests/')
  local files_to_check = {
    -- Source files (if the current file is a test file).
    string.gsub(filename_with_java_prefix, 'Test%.(.+)', '.%1'),
    -- Test files (if the current file is a source file).
    string.gsub(filename_with_javatests_prefix, '%.(.+)', 'Test.%1'),
  }
  vim.print(files_to_check)
  return filter_for_only_real_files(files_to_check)
end

local get_filename_relative_to_cwd = function(file)
  local cwd = vim.fn.getcwd() .. '/'
  return string.gsub(file, cwd, '')
end

M.find_related = function()
  local action_state = require('telescope.actions.state')
  local action_set = require('telescope.actions.set')
  local config = require('telescope.config').values
  local finders = require('telescope.finders')
  local pickers = require('telescope.pickers')
  local opts = {}
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  local related_files = {}
  related_files = concatenate_tables(related_files, get_build_files())
  if filetype == 'python' or filetype == 'go' then
    related_files =
      concatenate_tables(related_files, get_files_for_go_or_python())
  end
  if filetype == 'dart' or filetype == 'html' or filetype == 'scss' then
    related_files = concatenate_tables(related_files, get_files_for_acx())
  end
  if filetype == 'java' then
    related_files = concatenate_tables(related_files, get_files_for_java())
  end

  pickers
    .new(opts, {
      prompt_title = 'Find in Related Files',
      previewer = config.grep_previewer(opts),
      sorter = config.generic_sorter(opts),
      finder = finders.new_table({
        results = related_files,
        entry_maker = function(entry)
          return {
            value = entry.name,
            ordinal = entry.name,
            display = get_filename_relative_to_cwd(entry.name),
            lnum = entry.lnum,
          }
        end,
      }),
      attach_mappings = function()
        action_set.select:enhance({
          post = function()
            local selection = action_state.get_selected_entry()
            if selection.lnum ~= nil then
              vim.api.nvim_win_set_cursor(0, { selection.lnum, 0 })
            end
          end,
        })
        return true
      end,
    })
    :find()
end

return M
