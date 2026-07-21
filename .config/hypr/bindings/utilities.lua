O.bind("SUPER + SPACE", "Launch apps", { omarchy = "walker" })
O.bind("SUPER + CTRL + E", "Emoji picker", { omarchy = "walker -m symbols" })
O.bind_menu("SUPER + ESCAPE", "System menu", "system")
O.bind_menu("XF86PowerOff", "Power menu", "system", { locked = true })
O.bind("SUPER + K", "Show key bindings", "omarchy-menu-keybindings")
O.bind("SUPER + ALT + K", "Show Tmux key bindings", "omarchy-menu-tmux-keybindings")
O.bind("XF86Calculator", "Calculator", { focus = "gnome-calculator" })

O.bind("SUPER + SHIFT + SPACE", "Toggle top bar", "omarchy-toggle-waybar")

O.bind("SUPER + COMMA", "Dismiss last notification", "makoctl dismiss")
O.bind("SUPER + SHIFT + COMMA", "Dismiss all notifications", "makoctl dismiss --all")
O.bind("SUPER + ALT + COMMA", "Invoke last notification", "makoctl invoke")
O.bind("SUPER + SHIFT + ALT + COMMA", "Restore last notification", "makoctl restore")

O.bind_toggle("SUPER + CTRL + N", "Toggle nightlight", "nightlight")

O.bind("PRINT", "Screenshot", "omarchy-capture-screenshot")

O.bind_menu("SUPER + CTRL + R", "Set reminder", "reminder-set")
O.bind("SUPER + CTRL + SHIFT + R", "Clear reminders", "omarchy-reminder clear")
O.bind("SUPER + CTRL + ALT + R", "Show reminders", "omarchy-reminder show")

O.bind("SUPER + CTRL + ALT + T", "Show time", "omarchy-notification-time")
O.bind("SUPER + CTRL + ALT + B", "Show battery remaining", "omarchy-notification-battery")

O.bind("SUPER + CTRL + A", "Audio controls", { focus = "omarchy-launch-audio" })
O.bind("SUPER + CTRL + B", "Bluetooth controls", { focus = "omarchy-launch-bluetooth" })
O.bind("SUPER + CTRL + W", "Wifi controls", { focus = "omarchy-launch-wifi" })
O.bind("SUPER + CTRL + T", "Activity", { focus = "btop", uwsm_args = "-T" })

O.bind("SUPER + L", "Lock system", "omarchy-system-lock")

hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })
