---------------
---- INPUT ----
---------------
hl.config({
	input = {
		kb_layout = "is,dk",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_space_toggle",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},

	misc = {
		key_press_enables_dpms = true,
		mouse_move_enables_dpms = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
--[[
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
--]]
