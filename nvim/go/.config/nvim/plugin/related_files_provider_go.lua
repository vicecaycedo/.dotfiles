local function match()
  return vim.api.nvim_buf_get_name(0):match('%.go$') ~= nil
end

local function run()
  local relative_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
  local dirname = vim.fn.fnamemodify(relative_path, ':h')
  local filename = vim.fn.fnamemodify(relative_path, ':t')

  local target_name = ''
  if filename:match('_test%.go$') then
    target_name = filename:gsub('_test%.go$', '.go')
  elseif filename:match('%.go$') then
    target_name = filename:gsub('%.go$', '_test.go')
  end

  local target_path = dirname .. '/' .. target_name
  if dirname == '.' then
    target_path = target_name
  end
  if vim.fn.filereadable(target_path) == 0 then
    vim.notify(
      'No related files found for: ' .. relative_path,
      vim.log.levels.INFO
    )
    return
  end

  vim.cmd.edit(vim.fn.fnameescape(target_path))
end

require('vc.related_files_provider').register(
  ---@type vc.RelatedFilesProvider
  {
    match = match,
    run = run,
  }
)
