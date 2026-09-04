-- Imported by workspaces.lua
local M = {}

local lm = {
  output = "DP-1",
  mode = "1920x1200",
  position = "0x0",
  scale = 1,
  disabled = false,
}
M.lm = lm.output

local rm = {
  output = "DP-3",
  mode = "1920x1200",
  position = "1920x0",
  scale = 1,
  disabled = false,
}
M.rm = rm.output

local tv = {
  output = "HDMI-A-1",
  mode = "3840x2160@165",
  position = "3840x0",
  scale = 2,
  disabled = false,
  bitdepth = 10,
  cm = "srgb",
}
M.tv = tv.output

local tv_hdr = {
  output = "HDMI-A-1",
  mode = "3840x2160@165",
  position = "3840x0",
  scale = 2,
  disabled = false,
  bitdepth = 10,
  cm = "hdr",
  sdrbrightness = 1.2,
  sdrsaturation = 0.98,
}

-- local function tbl_to_str(tbl)
--   local prefix = ""
--   local parts = {}
--   for key, value in pairs(tbl) do
--     if (key == "output") then
--       prefix = value
--     else
--       table.insert(parts, tostring(key))
--       table.insert(parts, tostring(value))
--     end
--   end
--   return prefix + ", " + table.concat(parts, ", ")
-- end

local function serialize_table(tbl)
  local parts = {}
  for key, value in pairs(tbl) do
    if type(value) == "string" then
      value = '"' .. value .. '"'
    end
    if type(value) == "boolean" then
      value = tostring(value)
    end
    table.insert(parts, key .. " = " .. value)
  end
  return '{ ' .. table.concat(parts, ", ") .. ' }'
end

hl.monitor(tv)
hl.monitor({ output = lm.output, disabled = true })
hl.monitor({ output = rm.output, disabled = true })

-- hl.monitor(rm)
-- hl.monitor(lm)
-- hl.monitor({ output = tv.output, disabled = true })


-- hl.bind("SUPER + CONTROL + period", hl.dispatch("hyprctl --batch '\
--   keyword monitor " .. tbl_to_str(tv) .. " ; \
--   keyword monitor " .. lm.output .. ", disable ; \
--   keyword monitor " .. rm.output .. ", disable'"
-- ))
--
-- hl.bind("SUPER + CONTROL + comma", hl.dispatch("hyprctl --batch '\
--   keyword monitor " .. tbl_to_str(tv_hdr) .. " ; \
--   keyword monitor " .. lm.output .. ", disable ; \
--   keyword monitor " .. rm.output .. ", disable'"
-- ))
--
-- hl.bind("SUPER + CONTROL + minus", hl.dispatch("hyprctl --batch '\
--   keyword monitor " .. tv.output .. ", disable ; \
--   keyword monitor " .. tbl_to_str(lm) .. " ; \
--   keyword monitor " .. tbl_to_str(rm) .. " ;'"
-- ))

hl.bind("SUPER + CONTROL + period", hl.dsp.exec_cmd("hyprctl eval '\
  hl.monitor(" .. serialize_table(tv) .. "); \
  hl.monitor({ output = \"" .. lm.output .. "\", disabled = true }); \
  hl.monitor({ output = \"" .. rm.output .. "\", disabled = true })'"
))

hl.bind("SUPER + CONTROL + comma", hl.dsp.exec_cmd("hyprctl eval '\
  hl.monitor(" .. serialize_table(tv_hdr) .. "); \
  hl.monitor({ output = \"" .. lm.output .. "\", disabled = true }); \
  hl.monitor({ output = \"" .. rm.output .. "\", disabled = true })'"
))

hl.bind("SUPER + CONTROL + minus", hl.dsp.exec_cmd("hyprctl eval '\
  hl.monitor(" .. serialize_table(lm) .. "); \
  hl.monitor(" .. serialize_table(rm) .. "); \
  hl.monitor({ output = \"" .. tv.output .. "\", disabled = true })'"
))

return M
