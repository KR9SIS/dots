O.bind(MODKEY .. " + W", "Close window", hl.dsp.window.close())
O.bind("CTRL + ALT + DELETE", "Close all windows", "omarchy-hyprland-window-close-all")

O.bind(MODKEY .. " + J", "Toggle window split", hl.dsp.layout("togglesplit"))
-- o.bind(MODKEY .. " + P", "Pseudo window", hl.dsp.window.pseudo())
O.bind(MODKEY .. " + T", "Toggle window floating/tiling", hl.dsp.window.float({ action = "toggle" }))
O.bind(MODKEY .. " + F", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
-- o.bind(MODKEY .. " + CTRL + F", "Tiled full screen", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))
O.bind(MODKEY .. " + ALT + F", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))
O.bind(MODKEY .. " + O", "Pop window out (float & pin)", "omarchy-hyprland-window-pop")
O.bind(MODKEY .. " + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

O.bind(MODKEY .. " + LEFT", "Focus on left window", hl.dsp.focus({ direction = "l" }))
O.bind(MODKEY .. " + RIGHT", "Focus on right window", hl.dsp.focus({ direction = "r" }))
O.bind(MODKEY .. " + UP", "Focus on above window", hl.dsp.focus({ direction = "u" }))
O.bind(MODKEY .. " + DOWN", "Focus on below window", hl.dsp.focus({ direction = "d" }))

for workspace = 1, 10 do
	local key = "code:" .. tostring(workspace + 9)
	O.bind(
		MODKEY .. " + " .. key,
		"Switch to workspace " .. workspace,
		hl.dsp.focus({ workspace = tostring(workspace) })
	)
	O.bind(
		MODKEY .. " + SHIFT + " .. key,
		"Move window to workspace " .. workspace,
		hl.dsp.window.move({ workspace = tostring(workspace) })
	)
	O.bind(
		MODKEY .. " + SHIFT + ALT + " .. key,
		"Move window silently to workspace " .. workspace,
		hl.dsp.window.move({ workspace = tostring(workspace), follow = false })
	)
end

O.bind(MODKEY .. " + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
O.bind(
	MODKEY .. " + ALT + S",
	"Move window to scratchpad",
	hl.dsp.window.move({ workspace = "special:scratchpad", follow = false })
)

O.bind(MODKEY .. " + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
O.bind(MODKEY .. " + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
O.bind(MODKEY .. " + CTRL + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))

O.bind(MODKEY .. " + SHIFT + ALT + LEFT", "Move workspace to left monitor", hl.dsp.workspace.move({ monitor = "l" }))
O.bind(MODKEY .. " + SHIFT + ALT + RIGHT", "Move workspace to right monitor", hl.dsp.workspace.move({ monitor = "r" }))
O.bind(MODKEY .. " + SHIFT + ALT + UP", "Move workspace to up monitor", hl.dsp.workspace.move({ monitor = "u" }))
O.bind(MODKEY .. " + SHIFT + ALT + DOWN", "Move workspace to down monitor", hl.dsp.workspace.move({ monitor = "d" }))
O.bind(MODKEY .. " + SHIFT + ALT + KP_Add", "Move workspace to next monitor", hl.dsp.workspace.move({ monitor = "+1" }))
O.bind(
	MODKEY .. " + SHIFT + ALT + KP_Subtract",
	"Move workspace to prev monitor",
	hl.dsp.workspace.move({ monitor = "-1" })
)

O.bind(MODKEY .. " + SHIFT + LEFT", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
O.bind(MODKEY .. " + SHIFT + RIGHT", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
O.bind(MODKEY .. " + SHIFT + UP", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
O.bind(MODKEY .. " + SHIFT + DOWN", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

O.bind("ALT + TAB", "Focus on next window", hl.dsp.window.cycle_next())
O.bind("ALT + SHIFT + TAB", "Focus on previous window", hl.dsp.window.cycle_next({ next = false }))
O.bind("ALT + TAB", "Reveal active window on top", hl.dsp.window.bring_to_top())
O.bind("ALT + SHIFT + TAB", "Reveal active window on top", hl.dsp.window.bring_to_top())

O.bind("CTRL + ALT + TAB", "Focus on next monitor", hl.dsp.focus({ monitor = "+1" }))
O.bind("CTRL + ALT + SHIFT + TAB", "Focus on previous monitor", hl.dsp.focus({ monitor = "-1" }))

O.bind(MODKEY .. " + code:20", "Expand window left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
O.bind(MODKEY .. " + code:21", "Shrink window left", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
O.bind(MODKEY .. " + SHIFT + code:20", "Shrink window up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
O.bind(MODKEY .. " + SHIFT + code:21", "Expand window down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- code:20 = key to the right of 0
O.bind(
	MODKEY .. " + ALT + code:20",
	"Expand window left a little",
	hl.dsp.window.resize({ x = -25, y = 0, relative = true })
)
-- code:21 = key to the right of code:20
O.bind(
	MODKEY .. " + ALT + code:21",
	"Shrink window left a little",
	hl.dsp.window.resize({ x = 25, y = 0, relative = true })
)
O.bind(
	MODKEY .. " + SHIFT + ALT + code:20",
	"Shrink window up a little",
	hl.dsp.window.resize({ x = 0, y = -25, relative = true })
)
O.bind(
	MODKEY .. " + SHIFT + ALT + code:21",
	"Expand window down a little",
	hl.dsp.window.resize({ x = 0, y = 25, relative = true })
)

O.bind(
	MODKEY .. " + CTRL + code:20",
	"Expand window left a lot",
	hl.dsp.window.resize({ x = -300, y = 0, relative = true })
)
O.bind(
	MODKEY .. " + CTRL + code:21",
	"Shrink window left a lot",
	hl.dsp.window.resize({ x = 300, y = 0, relative = true })
)
O.bind(
	MODKEY .. " + CTRL + SHIFT + code:20",
	"Shrink window up a lot",
	hl.dsp.window.resize({ x = 0, y = -300, relative = true })
)
O.bind(
	MODKEY .. " + CTRL + SHIFT + code:21",
	"Expand window down a lot",
	hl.dsp.window.resize({ x = 0, y = 300, relative = true })
)

O.bind(MODKEY .. " + mouse_down", "Scroll active workspace forward", hl.dsp.focus({ workspace = "e+1" }))
O.bind(MODKEY .. " + mouse_up", "Scroll active workspace backward", hl.dsp.focus({ workspace = "e-1" }))

-- mouse:272 = left click
O.bind(MODKEY .. " + mouse:272", "Move window", hl.dsp.window.drag(), { mouse = true })
-- mouse:272 = right click
O.bind(MODKEY .. " + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })

O.bind(MODKEY .. " + G", "Toggle window grouping", hl.dsp.group.toggle())
O.bind(MODKEY .. " + ALT + G", "Move active window out of group", hl.dsp.window.move({ out_of_group = true }))

O.bind(MODKEY .. " + ALT + LEFT", "Move window to group on left", hl.dsp.window.move({ into_group = "l" }))
O.bind(MODKEY .. " + ALT + RIGHT", "Move window to group on right", hl.dsp.window.move({ into_group = "r" }))
O.bind(MODKEY .. " + ALT + UP", "Move window to group on top", hl.dsp.window.move({ into_group = "u" }))
O.bind(MODKEY .. " + ALT + DOWN", "Move window to group on bottom", hl.dsp.window.move({ into_group = "d" }))

O.bind(MODKEY .. " + ALT + TAB", "Next window in group", hl.dsp.group.next())
O.bind(MODKEY .. " + ALT + SHIFT + TAB", "Previous window in group", hl.dsp.group.prev())

O.bind(MODKEY .. " + CTRL + LEFT", "Move grouped window focus left", hl.dsp.group.prev())
O.bind(MODKEY .. " + CTRL + RIGHT", "Move grouped window focus right", hl.dsp.group.next())

O.bind(MODKEY .. " + ALT + mouse_down", "Next window in group", hl.dsp.group.next())
O.bind(MODKEY .. " + ALT + mouse_up", "Previous window in group", hl.dsp.group.prev())

for index = 1, 5 do
	O.bind(
		MODKEY .. " + ALT + code:" .. tostring(index + 9),
		"Switch to group window " .. index,
		hl.dsp.group.active({ index = index })
	)
end

-- code:61 = key to the left of right shift
O.bind(MODKEY .. " + code:61", "Cycle monitor scaling", "omarchy-hyprland-monitor-scaling-cycle")
O.bind(
	MODKEY .. " + ALT + code:61",
	"Cycle monitor scaling backwards",
	"omarchy-hyprland-monitor-scaling-cycle --reverse"
)
