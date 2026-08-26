hl.on("hyprland.start", function()
  hl.exec_cmd("swayidle -w \
    timeout 10 'if pgrep hyprlock; then hyprctl dispatch dpms off; fi' \
    resume 'hyprctl dispatch dpms on' \
    before-sleep 'hyprlock'")
end)
