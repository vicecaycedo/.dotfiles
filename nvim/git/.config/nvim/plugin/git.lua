nmap('<Leader>pm', function()
  Snacks.picker.git_status({
    title = 'Find in Modified Files',
  })
end, 'find in modified files')
