local M = {}

M.sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

M.set_section = function(section, components)
  M.sections[section] = components
end

return M
