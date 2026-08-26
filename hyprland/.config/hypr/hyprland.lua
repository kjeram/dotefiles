require("~/.config/hypr/autostart.lua")
require("~/.config/hypr/input.lua")
require("~/.config/hypr/keybinds.lua")
require("~/.config/hypr/theme.lua")
require("~/.config/hypr/windows.lua")
require("~/.config/hypr/workspaces.lua") -- monitors.lua imported by workspaces.lua

hl.config({
  xwayland = {
    force_zero_scaling = false
  }
})
