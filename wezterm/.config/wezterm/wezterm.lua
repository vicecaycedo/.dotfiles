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
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ActivateKeyTable({
      name = 'resize_pane',
      one_shot = false,
    }),
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

-- Resize panes mode.
config.key_tables = {
  resize_pane = {
    { key = 'h', action = wezterm.action.ActivatePaneDirection('Left') },
    { key = 'j', action = wezterm.action.ActivatePaneDirection('Down') },
    { key = 'k', action = wezterm.action.ActivatePaneDirection('Up') },
    { key = 'l', action = wezterm.action.ActivatePaneDirection('Right') },
    {
      key = 'h',
      mods = 'SHIFT',
      action = wezterm.action.AdjustPaneSize({ 'Left', 5 }),
    },
    {
      key = 'j',
      mods = 'SHIFT',
      action = wezterm.action.AdjustPaneSize({ 'Down', 5 }),
    },
    {
      key = 'k',
      mods = 'SHIFT',
      action = wezterm.action.AdjustPaneSize({ 'Up', 5 }),
    },
    {
      key = 'l',
      mods = 'SHIFT',
      action = wezterm.action.AdjustPaneSize({ 'Right', 5 }),
    },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'q', action = 'PopKeyTable' },
  },
}

wezterm.on('update-right-status', function(window, _)
  local table_name = window:active_key_table()
  if table_name == 'resize_pane' then
    window:set_right_status(wezterm.format({
      { Background = { Color = '#3c3836' } },
      { Foreground = { Color = '#fabd2f' } },
      { Text = ' RESIZE ' },
    }))
  else
    window:set_right_status('')
  end
end)

return config
