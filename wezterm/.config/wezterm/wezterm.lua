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
config.window_decorations = 'RESIZE'
-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 30

return config
