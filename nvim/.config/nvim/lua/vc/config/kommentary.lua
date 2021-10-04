local kommentary_config = require('kommentary.config')

kommentary_config.configure_language(
  'dart', {
    single_line_comment_string = '//',
    multi_line_comment_strings = { '/*', '*/' },
    prefer_single_line_comments = true,
  })

kommentary_config.configure_language(
  'lua', {
    single_line_comment_string = '--',
    multi_line_comment_strings = { '--[[', ']]' },
    prefer_single_line_comments = true,
  })

