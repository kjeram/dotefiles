-- Direction keys
local left = "h"
local down = "j"
local up = "k"
local right = "l"

local left_alt = "a"
local down_alt = "s"
local up_alt = "w"
local right_alt = "d"

local term = "kitty"
local bar = "~/Code/Waybar/build/waybar"
-- local bar = waybar

-- Move focus around
hl.bind("SUPER + " .. left, hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + " .. down, hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + " .. up, hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + " .. right, hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + p", hl.dsp.window.cycle_next())
hl.bind("SUPER + n", hl.dsp.window.cycle_next({ next = false }))

-- Move the focused window with the same, but add SHIFT
hl.bind("SUPER + SHIFT + " .. left, hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + " .. down, hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + " .. up, hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + " .. right, hl.dsp.window.move({ direction = "r" }))

-- Bar
hl.bind("SUPER + b", hl.dsp.exec_cmd(bar))
hl.bind("SUPER + SHIFT + b", hl.dsp.exec_cmd("pkill waybar"))

-- Termninal
hl.bind("SUPER + Return", hl.dsp.exec_cmd(term))

-- Lock the screen
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("hyprlock"))

-- Power related binds
hl.bind("SUPER + SHIFT + CONTROL + ALT + F4", hl.dsp.exec_cmd("uwsm stop"))

-- Launcher
hl.bind("SUPER + Space", hl.dsp.exec_cmd("rofi -show drun"))

-- Kill focused window
hl.bind("SUPER + SHIFT + C", hl.dsp.window.close())

-- dwindle
hl.bind("SUPER + Tab", hl.dsp.layout("togglesplit"))

-- Make the current focus fullscreen
hl.bind("SUPER + ALT + f", hl.dsp.window.fullscreen())
hl.bind("SUPER + ALT + SHIFT + f", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))
hl.bind("SUPER + ALT + CONTROL + f", hl.dsp.window.fullscreen_state({ internal = 1, client = 0 }))

-- Float window
hl.bind("SUPER + SHIFT + space", hl.dsp.window.float())

-- scroll through existing workspaces with mainMod + scroll

hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "m-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + x", hl.dsp.cursor.move({ x = 10, y = 10 }))
hl.bind("SUPER + z", hl.dsp.submap("fastedit"))

hl.define_submap("resize", function()
  hl.bind("CTRL + " .. right_alt, hl.dsp.window.resize({ x = 1, y = 0 }))
  hl.bind("CTRL + " .. left_alt, hl.dsp.window.resize({ x = -1, y = 0 }))
  hl.bind("CTRL + " .. up_alt, hl.dsp.window.resize({ x = 0, y = -1 }))
  hl.bind("CTRL + " .. down_alt, hl.dsp.window.resize({ x = 0, y = 1 }))

  hl.bind(right_alt, hl.dsp.window.resize({ x = 10, y = 0 }))
  hl.bind(left_alt, hl.dsp.window.resize({ x = -10, y = 0 }))
  hl.bind(up_alt, hl.dsp.window.resize({ x = 0, y = -10 }))
  hl.bind(down_alt, hl.dsp.window.resize({ x = 0, y = 10 }))

  hl.bind("SHIFT + " .. right_alt, hl.dsp.window.resize({ x = 50, y = 0 }))
  hl.bind("SHIFT + " .. left_alt, hl.dsp.window.resize({ x = -50, y = 0 }))
  hl.bind("SHIFT + " .. up_alt, hl.dsp.window.resize({ x = 0, y = -50 }))
  hl.bind("SHIFT + " .. down_alt, hl.dsp.window.resize({ x = 0, y = 50 }))

  hl.bind(left, hl.dsp.focus({ direction = "left" }))
  hl.bind(down, hl.dsp.focus({ direction = "down" }))
  hl.bind(up, hl.dsp.focus({ direction = "up" }))
  hl.bind(right, hl.dsp.focus({ direction = "right" }))

  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Screenshit
hl.bind("print", hl.dsp.exec_cmd("grim"))

-- bindpl = , XF86AudioMute, exec, amixer sset "Master" toggle
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute $(pactl get-default-sink) toggle"),
  { pass = true, locked = true })

-- mpc Keybinds
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("mpc volume +1"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("mpc volume -1"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("mpc stop"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("mpc prev"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("mpc next"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("mpc toggle"))
