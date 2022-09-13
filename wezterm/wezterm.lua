local wezterm = require 'wezterm'
local act = wezterm.action
return {

  font_size = 15.0,
  font = wezterm.font('Victor Mono', { weight='DemiBold' }),
  color_scheme = "ayu",
  force_reverse_video_cursor = false,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  window_padding = { left = '1px', right = '1px', top = 0, bottom = 0 },
  show_update_window = false,

  keys = {
    { key = '\\', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '|', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'D', mods = 'CTRL', action = act.CloseCurrentPane { confirm = true } },
    { key = '/', mods = 'CTRL', action = act.ShowTabNavigator },
    { key = 'L', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right', },
    { key = 'H', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left', },
  },
}
