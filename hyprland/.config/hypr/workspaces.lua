local M = require("~/.config/hypr/monitors.lua")

local ws_1 = "1"
local ws_2 = "2"
local ws_3 = "3"
local ws_4 = "4"

local ws_q = "5"
local ws_w = "6"
local ws_e = "7"
local ws_r = "8"

local ws_a = "9"
local ws_s = "10"
local ws_d = "11"
local ws_f = "12"

local ws_5 = "13"
local ws_6 = "14"
local ws_7 = "15"
local ws_8 = "16"
local ws_9 = "17"
local ws_0 = "18"

local ws_t = "19"
local ws_y = "20"
local ws_u = "21"
local ws_i = "22"
local ws_o = "23"
local ws_p = "24"

hl.workspace_rule({ workspace = ws_1, default_name = "1", monitor = M.lm, })
hl.workspace_rule({ workspace = ws_2, default_name = "2", monitor = M.lm, })
hl.workspace_rule({ workspace = ws_3, default_name = "3", monitor = M.rm, })
hl.workspace_rule({ workspace = ws_4, default_name = "4", monitor = M.rm, })
hl.workspace_rule({ workspace = ws_q, default_name = "Q", monitor = M.lm, })
hl.workspace_rule({ workspace = ws_w, default_name = "W", monitor = M.lm, })
hl.workspace_rule({ workspace = ws_e, default_name = "E", monitor = M.rm, })
hl.workspace_rule({ workspace = ws_r, default_name = "R", monitor = M.rm, })
hl.workspace_rule({ workspace = ws_a, default_name = "A", monitor = M.lm, })
hl.workspace_rule({ workspace = ws_s, default_name = "S", monitor = M.lm, })
hl.workspace_rule({ workspace = ws_d, default_name = "D", monitor = M.rm, })
hl.workspace_rule({ workspace = ws_f, default_name = "F", monitor = M.rm, })

hl.workspace_rule({ workspace = ws_5, default_name = "5", })
hl.workspace_rule({ workspace = ws_6, default_name = "6", })
hl.workspace_rule({ workspace = ws_7, default_name = "7", })
hl.workspace_rule({ workspace = ws_8, default_name = "8", })
hl.workspace_rule({ workspace = ws_9, default_name = "9", })
hl.workspace_rule({ workspace = ws_0, default_name = "0", })
hl.workspace_rule({ workspace = ws_t, default_name = "T", })
hl.workspace_rule({ workspace = ws_y, default_name = "Y", })
hl.workspace_rule({ workspace = ws_u, default_name = "U", })
hl.workspace_rule({ workspace = ws_i, default_name = "I", })
hl.workspace_rule({ workspace = ws_o, default_name = "O", })
hl.workspace_rule({ workspace = ws_p, default_name = "P", })

-- Switch to workspace
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = ws_1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = ws_2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = ws_3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = ws_4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = ws_5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = ws_6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = ws_7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = ws_8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = ws_9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = ws_0 }))
hl.bind("SUPER + q", hl.dsp.focus({ workspace = ws_q }))
hl.bind("SUPER + w", hl.dsp.focus({ workspace = ws_w }))
hl.bind("SUPER + e", hl.dsp.focus({ workspace = ws_e }))
hl.bind("SUPER + r", hl.dsp.focus({ workspace = ws_r }))
hl.bind("SUPER + t", hl.dsp.focus({ workspace = ws_t }))
hl.bind("SUPER + y", hl.dsp.focus({ workspace = ws_y }))
hl.bind("SUPER + u", hl.dsp.focus({ workspace = ws_u }))
hl.bind("SUPER + i", hl.dsp.focus({ workspace = ws_i }))
hl.bind("SUPER + o", hl.dsp.focus({ workspace = ws_o }))
hl.bind("SUPER + p", hl.dsp.focus({ workspace = ws_p }))
hl.bind("SUPER + a", hl.dsp.focus({ workspace = ws_a }))
hl.bind("SUPER + s", hl.dsp.focus({ workspace = ws_s }))
hl.bind("SUPER + d", hl.dsp.focus({ workspace = ws_d }))
hl.bind("SUPER + f", hl.dsp.focus({ workspace = ws_f }))

-- move focused container to workspace
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = ws_1, follow = false }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = ws_2, follow = false }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = ws_3, follow = false }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = ws_4, follow = false }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = ws_5, follow = false }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = ws_6, follow = false }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = ws_7, follow = false }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = ws_8, follow = false }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = ws_9, follow = false }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = ws_0, follow = false }))
hl.bind("SUPER + SHIFT + q", hl.dsp.window.move({ workspace = ws_q, follow = false }))
hl.bind("SUPER + SHIFT + w", hl.dsp.window.move({ workspace = ws_w, follow = false }))
hl.bind("SUPER + SHIFT + e", hl.dsp.window.move({ workspace = ws_e, follow = false }))
hl.bind("SUPER + SHIFT + r", hl.dsp.window.move({ workspace = ws_r, follow = false }))
hl.bind("SUPER + SHIFT + t", hl.dsp.window.move({ workspace = ws_t, follow = false }))
hl.bind("SUPER + SHIFT + y", hl.dsp.window.move({ workspace = ws_y, follow = false }))
hl.bind("SUPER + SHIFT + u", hl.dsp.window.move({ workspace = ws_u, follow = false }))
hl.bind("SUPER + SHIFT + i", hl.dsp.window.move({ workspace = ws_i, follow = false }))
hl.bind("SUPER + SHIFT + o", hl.dsp.window.move({ workspace = ws_o, follow = false }))
hl.bind("SUPER + SHIFT + p", hl.dsp.window.move({ workspace = ws_p, follow = false }))
hl.bind("SUPER + SHIFT + a", hl.dsp.window.move({ workspace = ws_a, follow = false }))
hl.bind("SUPER + SHIFT + s", hl.dsp.window.move({ workspace = ws_s, follow = false }))
hl.bind("SUPER + SHIFT + d", hl.dsp.window.move({ workspace = ws_d, follow = false }))
hl.bind("SUPER + SHIFT + f", hl.dsp.window.move({ workspace = ws_f, follow = false }))

-- move focused containter to workspace and move to workspace
hl.bind("SUPER + CONTROL + 1", hl.dsp.window.move({ workspace = ws_1, follow = true }))
hl.bind("SUPER + CONTROL + 2", hl.dsp.window.move({ workspace = ws_2, follow = true }))
hl.bind("SUPER + CONTROL + 3", hl.dsp.window.move({ workspace = ws_3, follow = true }))
hl.bind("SUPER + CONTROL + 4", hl.dsp.window.move({ workspace = ws_4, follow = true }))
hl.bind("SUPER + CONTROL + 5", hl.dsp.window.move({ workspace = ws_5, follow = true }))
hl.bind("SUPER + CONTROL + 6", hl.dsp.window.move({ workspace = ws_6, follow = true }))
hl.bind("SUPER + CONTROL + 7", hl.dsp.window.move({ workspace = ws_7, follow = true }))
hl.bind("SUPER + CONTROL + 8", hl.dsp.window.move({ workspace = ws_8, follow = true }))
hl.bind("SUPER + CONTROL + 9", hl.dsp.window.move({ workspace = ws_9, follow = true }))
hl.bind("SUPER + CONTROL + 0", hl.dsp.window.move({ workspace = ws_0, follow = true }))
hl.bind("SUPER + CONTROL + q", hl.dsp.window.move({ workspace = ws_q, follow = true }))
hl.bind("SUPER + CONTROL + w", hl.dsp.window.move({ workspace = ws_w, follow = true }))
hl.bind("SUPER + CONTROL + e", hl.dsp.window.move({ workspace = ws_e, follow = true }))
hl.bind("SUPER + CONTROL + r", hl.dsp.window.move({ workspace = ws_r, follow = true }))
hl.bind("SUPER + CONTROL + t", hl.dsp.window.move({ workspace = ws_t, follow = true }))
hl.bind("SUPER + CONTROL + y", hl.dsp.window.move({ workspace = ws_y, follow = true }))
hl.bind("SUPER + CONTROL + u", hl.dsp.window.move({ workspace = ws_u, follow = true }))
hl.bind("SUPER + CONTROL + i", hl.dsp.window.move({ workspace = ws_i, follow = true }))
hl.bind("SUPER + CONTROL + o", hl.dsp.window.move({ workspace = ws_o, follow = true }))
hl.bind("SUPER + CONTROL + p", hl.dsp.window.move({ workspace = ws_p, follow = true }))
hl.bind("SUPER + CONTROL + a", hl.dsp.window.move({ workspace = ws_a, follow = true }))
hl.bind("SUPER + CONTROL + s", hl.dsp.window.move({ workspace = ws_s, follow = true }))
hl.bind("SUPER + CONTROL + d", hl.dsp.window.move({ workspace = ws_d, follow = true }))
hl.bind("SUPER + CONTROL + f", hl.dsp.window.move({ workspace = ws_f, follow = true }))

-- Swap workspaces
-- TODO: manual review (unknown dispatcher: movecurrentworkspacetomonitor)
-- hl.bind("$mod + less", hl.dsp.movecurrentworkspacetomonitor("local_var_M.lm"))
-- TODO: manual review (unknown dispatcher: movecurrentworkspacetomonitor)
-- hl.bind("$mod + SHIFT + less", hl.dsp.movecurrentworkspacetomonitor("local_var_M.rm"))

hl.bind("SUPER + ALT + less", hl.dsp.exec_cmd("hyprctl --batch '\
  dispatch moveworkspacetomonitor 1 " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor 2 " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor 3 " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor 4 " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor Q " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor W " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor E " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor R " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor A " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor S " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor D " .. M.tv .. " ; \
  dispatch moveworkspacetomonitor F " .. M.tv
))

hl.bind("SUPER + CONTROL + less", hl.dsp.exec_cmd("hyprctl --batch '\
  dispatch moveworkspacetomonitor 1 " .. M.lm .. " ; \
  dispatch moveworkspacetomonitor 2 " .. M.lm .. " ; \
  dispatch moveworkspacetomonitor 3 " .. M.rm .. " ; \
  dispatch moveworkspacetomonitor 4 " .. M.rm .. " ; \
  dispatch moveworkspacetomonitor Q " .. M.lm .. " ; \
  dispatch moveworkspacetomonitor W " .. M.lm .. " ; \
  dispatch moveworkspacetomonitor E " .. M.rm .. " ; \
  dispatch moveworkspacetomonitor R " .. M.rm .. " ; \
  dispatch moveworkspacetomonitor A " .. M.lm .. " ; \
  dispatch moveworkspacetomonitor S " .. M.lm .. " ; \
  dispatch moveworkspacetomonitor D " .. M.rm .. " ; \
  dispatch moveworkspacetomonitor F " .. M.rm
))
