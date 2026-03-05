---@type wk.Opts
local opts = {
  delay = 400,
  plugins = {
    presets = {
      motions = false,
      operators = false,
      text_objects = false,
    },
  },
  show_help = false,
  icons = {
    mappings = false,
  },
}

---@type LazyPluginSpec
return {
  'folke/which-key.nvim',
  opts = opts,
}
