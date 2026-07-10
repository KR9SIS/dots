-- Work around Hyprland send_shortcut sometimes leaving synthetic key state stuck/repeating.
-- https://github.com/hyprwm/Hyprland/discussions/14099
local function send_shortcut_once(mods, key)
	return function()
		hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down", window = "activewindow" }))

		hl.timer(function()
			hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up", window = "activewindow" }))
		end, { timeout = 50, type = "oneshot" })
	end
end

O.bind(MODKEY .. " + C", "Universal copy", send_shortcut_once("CTRL", "Insert"))
O.bind(MODKEY .. " + V", "Universal paste", send_shortcut_once("SHIFT", "Insert"))
O.bind(MODKEY .. " + X", "Universal cut", send_shortcut_once("CTRL", "X"))
O.bind(MODKEY .. " + CTRL + V", "Clipboard manager", { omarchy = "walker -m clipboard" })
