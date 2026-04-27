require('lualine').setup({
  extensions = {
    'oil',
    'quickfix',
  },
  options = {
    component_separators = '',
    section_separators = '',
    globalstatus = true,
  },
  sections = require('vc.lualine').sections,
})
