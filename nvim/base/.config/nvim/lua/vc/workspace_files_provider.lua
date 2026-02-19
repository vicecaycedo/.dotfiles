local M = {}

M.providers = {}

M.register = function(provider)
  table.insert(M.providers, provider)
end

M.pick = function()
  for _, provider in ipairs(M.providers) do
    local ok, matched = pcall(provider.match)
    if ok and matched then
      return provider
    end
  end
end

return M
