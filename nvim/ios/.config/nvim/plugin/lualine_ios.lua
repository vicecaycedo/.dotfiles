require('vc.lualine').set_section('lualine_y', {
  function()
    if vim.g.xcodebuild_device_name then
      if vim.g.xcodebuild_os then
        return vim.g.xcodebuild_device_name .. ' (' .. vim.g.xcodebuild_os .. ')'
      end
      return vim.g.xcodebuild_device_name
    end
    return ''
  end,
})
