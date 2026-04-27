local function match()
  return vim.fn.filereadable('Tuist.swift') == 1
    and vim.api.nvim_buf_get_name(0):match('%.swift$') ~= nil
end

local function run()
  local relative_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
  local filename = vim.fn.fnamemodify(relative_path, ':t')
  local basename = vim.fn.fnamemodify(filename, ':t:r')

  local target_root = ''
  local target_basename = ''
  if relative_path:find('/Sources/', 1, true) then
    target_root = 'Tests'
    target_basename = basename .. 'Tests'
  elseif relative_path:find('/Tests/', 1, true) then
    target_root = 'Sources'
    target_basename = basename:gsub('Tests$', '')
  else
    vim.notify(
      'Current file is not in */Sources or */Tests: ' .. relative_path,
      vim.log.levels.WARN
    )
    return
  end

  local pattern = '*/' .. target_root .. '/**/' .. target_basename .. '.swift'
  local matches = vim.fn.globpath('.', pattern, false, true)

  if #matches == 0 then
    vim.notify(
      'No related files found for: ' .. relative_path,
      vim.log.levels.INFO
    )
    return
  end

  for i, path in ipairs(matches) do
    matches[i] = vim.fn.fnamemodify(path, ':.')
  end

  if #matches == 1 then
    vim.cmd.edit(vim.fn.fnameescape(matches[1]))
    return
  end

  local args = {}
  for _, file in ipairs(matches) do
    table.insert(args, '-g')
    table.insert(args, file)
  end

  Snacks.picker.files({
    title = 'Related iOS files',
    cmd = 'rg',
    hidden = true,
    follow = true,
    args = args,
  })
end

require('vc.related_files_provider').register(
  ---@type vc.RelatedFilesProvider
  {
    match = match,
    run = run,
  }
)
