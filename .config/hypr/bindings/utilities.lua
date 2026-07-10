O.bind(MODKEY .. " + SPACE", "Launch apps", { omarchy = "walker" })
O.bind(MODKEY .. " + CTRL + E", "Emoji picker", { omarchy = "walker -m symbols" })
O.bind_menu(MODKEY .. " + ESCAPE", "System menu", "system")
O.bind_menu("XF86PowerOff", "Power menu", "system", { locked = true })
O.bind(MODKEY .. " + K", "Show key bindings", "omarchy-menu-keybindings")
O.bind(MODKEY .. " + ALT + K", "Show Tmux key bindings", "omarchy-menu-tmux-keybindings")
O.bind("XF86Calculator", "Calculator", "gnome-calculator")

O.bind(MODKEY .. " + SHIFT + SPACE", "Toggle top bar", "omarchy-toggle-waybar")

O.bind(MODKEY .. " + COMMA", "Dismiss last notification", "makoctl dismiss")
O.bind(MODKEY .. " + SHIFT + COMMA", "Dismiss all notifications", "makoctl dismiss --all")
O.bind(MODKEY .. " + ALT + COMMA", "Invoke last notification", "makoctl invoke")
O.bind(MODKEY .. " + SHIFT + ALT + COMMA", "Restore last notification", "makoctl restore")

O.bind_toggle(MODKEY .. " + CTRL + N", "Toggle nightlight", "nightlight")

O.bind("PRINT", "Screenshot", "omarchy-capture-screenshot")

O.bind_menu(MODKEY .. " + CTRL + R", "Set reminder", "reminder-set")
O.bind(MODKEY .. " + CTRL + SHIFT + R", "Clear reminders", "omarchy-reminder clear")
O.bind(MODKEY .. " + CTRL + ALT + R", "Show reminders", "omarchy-reminder show")

O.bind(MODKEY .. " + CTRL + ALT + T", "Show time", "omarchy-notification-time")
O.bind(MODKEY .. " + CTRL + ALT + B", "Show battery remaining", "omarchy-notification-battery")

O.bind(MODKEY .. " + CTRL + A", "Audio controls", { omarchy = "audio" })
O.bind(MODKEY .. " + CTRL + B", "Bluetooth controls", { omarchy = "bluetooth" })
O.bind(MODKEY .. " + CTRL + W", "Wifi controls", { omarchy = "wifi" })
O.bind(MODKEY .. " + CTRL + T", "Activity", { tui = "btop" })

O.bind(MODKEY .. " + CTRL + Z", "Zoom in", function()
	local zoom = hl.get_config("cursor.zoom_factor") or 1
	hl.config({ cursor = { zoom_factor = zoom + 1 } })
end)

O.bind(MODKEY .. " + CTRL + ALT + Z", "Reset zoom", function()
	hl.config({ cursor = { zoom_factor = 1 } })
end)

O.bind(MODKEY .. " + CTRL + L", "Lock system", "omarchy-system-lock")
