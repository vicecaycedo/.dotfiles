---@diagnostic disable:undefined-global
return {
  s('dns', t('DO_NOT_SUBMIT')),
  s('md', t('MARKDOWN=true')),
  s('vc', t('vicentecaycedo')),
  s(
    'date',
    f(function()
      return os.date('%Y-%m-%d')
    end)
  ),
}
