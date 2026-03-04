local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Color Scheme
config.color_scheme = 'Vs Code Dark+ (Gogh)'

-- Font
config.font = wezterm.font('JetBrains Mono')
config.font_size = 15
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- Disable ligatures.
config.line_height = 1.1

-- Window
-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'
-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 30

-- Keybindings
config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Left'),
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Right'),
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Up'),
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Down'),
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
}

return config
