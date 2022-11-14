local M = {}

local tmux = require('vc.tmux')

-- TODO: Support executing test from source file, e.g. current buffer is foo.py
-- and I want to run foo_test.py.
local get_test_target = function()
  local dir = vim.fn.expand('%:h')
  local filename_tail = vim.fn.expand('%:t')
  local filename_stripped = string.gsub(filename_tail, '%.%w+', '')
  return dir .. ':' .. filename_stripped
end

M.test_file = function()
  local test_target = get_test_target()
  tmux.send_command_and_navigate('blaze run ' .. test_target)
end

local get_test_under_cursor = function()
  local buf = vim.api.nvim_get_current_buf()
  local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
  local parser = vim.treesitter.get_parser(buf)
  local tree = parser:parse()[1]
  local tree_root = tree:root()
  local query = vim.treesitter.parse_query(
    'python',
    [[
    (class_definition
      name: (identifier) @test_class_name
      body: (block
        [
        (function_definition
          name: (identifier) @test_function_name
        ) @test_function_definition
        (decorated_definition
          (decorator)
          (function_definition
            name: (identifier) @test_function_name
          )
        ) @test_decorated_function_definition
        ]
      )
    )
    ]]
  )
  for _, match, _ in query:iter_matches(tree_root, buf) do
    -- Process the match to get the test info (name, range, etc.).
    local test_class_name, test_function_name
    local test_function_start_row, test_function_end_row
    for id, node in pairs(match) do
      local capture_name = query.captures[id]
      if capture_name == 'test_class_name' then
        test_class_name = vim.treesitter.get_node_text(node, buf)
      elseif capture_name == 'test_function_name' then
        test_function_name = vim.treesitter.get_node_text(node, buf)
      elseif
        capture_name == 'test_function_definition'
        or capture_name == 'test_decorated_function_definition'
      then
        local start_row, _, end_row, _ = node:range()
        test_function_start_row = start_row + 1
        test_function_end_row = end_row + 1
      end
    end
    -- If the cursor is in the match range, return the matched test.
    if
      cursor_row >= test_function_start_row
      and cursor_row <= test_function_end_row
    then
      local test_filter = test_class_name .. '.' .. test_function_name
      return test_filter
    end
  end
end

-- TODO: Display error message if the current file is not a test file or if
-- there is no function under the cursor.
M.test_function = function()
  local test_target = get_test_target()
  local test_under_cursor = get_test_under_cursor()
  if test_under_cursor then
    tmux.send_command_and_navigate(
      'blaze run ' .. test_target .. ' --test_filter=' .. test_under_cursor
    )
  end
end

return M
