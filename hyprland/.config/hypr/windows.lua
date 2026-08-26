-- Runelite
hl.window_rule({
  name = "runelite-tooltips",
  match = {
    class = "^(net-runelite-client-RuneLite)$",
    title = "^win(.*)$"
  },
  no_initial_focus = true
})
