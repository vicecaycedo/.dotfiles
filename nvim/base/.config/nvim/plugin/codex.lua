local scratch_bufnr

---@return integer
local function get_scratch_bufnr()
  if scratch_bufnr and vim.api.nvim_buf_is_valid(scratch_bufnr) then
    return scratch_bufnr
  end

  local bufnr = vim.api.nvim_create_buf(false, false)
  vim.bo[bufnr].bufhidden = 'hide'
  vim.bo[bufnr].buftype = 'nofile'
  vim.bo[bufnr].filetype = 'markdown'
  vim.bo[bufnr].swapfile = false

  vim.keymap.set('n', '<Esc>', function()
    pcall(vim.api.nvim_win_close, 0, false)
  end, {
    buffer = bufnr,
    desc = 'close Codex review',
    silent = true,
  })

  scratch_bufnr = bufnr
  return bufnr
end

local function open_review()
  local bufnr = get_scratch_bufnr()
  local winid = vim.fn.bufwinid(bufnr)

  if winid ~= -1 then
    vim.api.nvim_set_current_win(winid)
    return
  end

  vim.cmd('botright split')
  winid = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(winid, bufnr)
end

---@param bufnr integer
---@param start_line integer
---@param end_line? integer
---@return string[]
local function build_entry(bufnr, start_line, end_line)
  local relative_path =
    vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':.')

  local header = string.format('%s:%d', relative_path, start_line)
  if end_line ~= nil then
    header = string.format('%s:%d-%d', relative_path, start_line, end_line)
  end

  local opening_fence = '```'
  local filetype = vim.bo[bufnr].filetype
  if filetype ~= '' then
    opening_fence = opening_fence .. filetype
  end

  local entry = {
    header,
    '',
    opening_fence,
  }

  local lines = vim.api.nvim_buf_get_lines(
    bufnr,
    start_line - 1,
    end_line or start_line,
    false
  )

  vim.list_extend(entry, lines)
  vim.list_extend(entry, {
    '```',
    '',
    'Comment:',
    '',
  })

  return entry
end

---@param entry string[]
local function append(entry)
  local bufnr = get_scratch_bufnr()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  if #lines == 1 and lines[1] == '' then
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, entry)
  else
    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { '', '---', '' })
    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, entry)
  end
end

local function focus()
  open_review()

  -- Jump to the blank comment line and start editing immediately.
  vim.api.nvim_win_set_cursor(
    0,
    { vim.api.nvim_buf_line_count(get_scratch_bufnr()), 0 }
  )
  vim.cmd.startinsert()
end

local function append_line()
  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  append(build_entry(bufnr, line))
  focus()
end

local function append_visual_selection()
  local bufnr = vim.api.nvim_get_current_buf()

  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
  local visual_line = vim.fn.getpos('v')[2]
  local start_line = math.min(visual_line, cursor_line)
  local end_line = math.max(visual_line, cursor_line)

  local entry = build_entry(bufnr, start_line, end_line)
  append(entry)
  focus()
end

local function close_review()
  local winid = vim.fn.bufwinid(get_scratch_bufnr())

  if winid ~= -1 then
    vim.api.nvim_win_close(winid, false)
  end
end

local function copy_and_reset()
  local bufnr = get_scratch_bufnr()
  local text =
    table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), '\n')

  vim.fn.setreg('+', text)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { '' })
  close_review()
  vim.notify('Copied review comments and reset buffer')
end

local nmap = require('vc.keymap').nmap
nmap('<Leader>aa', append_line, 'append line to Codex review')
nmap('<Leader>ao', open_review, 'open Codex review')
nmap('<Leader>ay', copy_and_reset, 'copy and clear Codex review')

vim.keymap.set(
  'x',
  '<Leader>aa',
  append_visual_selection,
  { desc = 'append selection to Codex review' }
)
