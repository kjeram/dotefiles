local M = require("~/.config/hypr/mocha.lua")

-- Set cursor gtk-cursor-theme-name in .config/gtk-3.0/settings.ini for xwayland
local cursor = "catppuccin-mocha-dark-cursors"
local gtk_theme = "catppuccin-mocha-red-standard+default"
local font_family = "Noto"

hl.env("HYPRCURSOR_THEME", cursor)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XCURSOR_THEME", cursor)
hl.env("XCURSOR_SIZE", 24)

hl.on("hyprland.start", function()
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme " .. cursor)
  hl.exec_cmd("hyprctl setcursor " .. cursor .. " 24")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface " .. gtk_theme)
  hl.exec_cmd("swaybg -c " .. M.crustAlpha)
end)

hl.on("config.reloaded", function()
  hl.exec_cmd("swaybg -c " .. M.crustAlpha)
end)

hl.config({
  general = {
    border_size = 1,
    gaps_in = 3,
    gaps_out = 6,
    layout = "dwindle",
    col = {
      inactive_border = M.overlay0,
      active_border = M.lavender,
    },
  },
  dwindle = {
    preserve_split = true,
  },
})

hl.config({
  decoration = {
    rounding = 6,
  },
})

hl.config({
  animations = {
    enabled = true,
  },
})

-- hl.animation({ leaf = "workspaces", enabled = true, speed = 6, curve = "default", style = "slidefade 20%" })
-- hl.animation({ leaf = "windows", enabled = true, speed = 6, curve = "default", style = "slide left" })

hl.config({
  misc = {
    disable_hyprland_logo = true,
    font_family = font_family,
    force_default_wallpaper = 1,
    mouse_move_focuses_monitor = true,
  },
})
