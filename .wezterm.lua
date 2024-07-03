-- wezterm configuration file

local wezterm = require 'wezterm';

return {
  -- Font configuration
  font = wezterm.font("JetBrains Mono", {weight="Regular", stretch="Normal", style="Normal"}),
  font_size = 12.0,

  -- Fallback font
  font_rules = {
    {
      italic = false,
      intensity = "Normal",
      font = wezterm.font_with_fallback({
        "JetBrains Mono",
        "Symbola"
      }),
    },
  },

  -- Window padding
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  },

  -- Shell configuration
  default_prog = {"/bin/zsh", "-l"},

  -- Colors configuration
  colors = {
    foreground = "#a9b1d6",
    background = "#000000",
    cursor_bg = "#c0caf5",
    cursor_fg = "#000000",
    cursor_border = "#c0caf5",

    selection_fg = "#000000",
    selection_bg = "#7aa2f7",

    scrollbar_thumb = "#222222",
    split = "#444444",

    ansi = {"#000000", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6"},
    brights = {"#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5"},
  },

  -- Cursor style
  default_cursor_style = "SteadyBlock",
  cursor_blink_rate = 0,

  -- Size configuration
  initial_cols = 180,
  initial_rows = 84,

  -- Opacity
  window_background_opacity = 0.8,
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 0.75,
  },

  -- Keys configuration
  keys = {
    -- Add key bindings here based on your st config
    -- Example:
    {key="q", mods="ALT", action=wezterm.action.ShowTabNavigator},
   -- Skip close confirmation
  },
    window_close_confirmation = 'NeverPrompt',
}

