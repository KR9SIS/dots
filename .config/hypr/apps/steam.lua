O.window("steam", { float = true, idle_inhibit = "fullscreen" })
O.window({ class = "steam", title = "Steam" }, { center = true, size = { 1100, 700 } })
O.window("steam.*", { tag = "-default-opacity", opacity = "1 1" })
O.window({ class = "steam", title = "Friends List" }, { size = { 460, 800 } })
