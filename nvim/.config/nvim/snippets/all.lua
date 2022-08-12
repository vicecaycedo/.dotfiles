---@diagnostic disable:undefined-global
return {
  s('dns', t('DO_NOT_SUBMIT')),
  s('vc', t('vicentecaycedo')),
  s(
    'date',
    f(function()
      return os.date('%Y-%m-%d')
    end)
  ),
  -- Google CL tags (go/single-line-tags).
  s('md', t('MARKDOWN=true')),
  s('au', t('AUTOSUBMIT_BEHAVIOR=SYNC_SUBMIT_CLEANUP')),
}
