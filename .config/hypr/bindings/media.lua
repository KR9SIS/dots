-- Volume, brightness, keyboard backlight, and touchpad controls.
O.bind(
	"XF86AudioRaiseVolume",
	"Volume up",
	"omarchy-swayosd-client --output-volume raise",
	{ locked = true, repeating = true }
)
O.bind(
	"XF86AudioLowerVolume",
	"Volume down",
	"omarchy-swayosd-client --output-volume lower",
	{ locked = true, repeating = true }
)
O.bind(
	"XF86AudioMute",
	"Mute",
	"omarchy-swayosd-client --output-volume mute-toggle",
	{ locked = true, repeating = true }
)
O.bind("XF86AudioMicMute", "Mute microphone", "omarchy-audio-input-mute", { locked = true, repeating = true })
O.bind("XF86MonBrightnessUp", "Brightness up", "omarchy-brightness-display +5%", { locked = true, repeating = true })
O.bind(
	"XF86MonBrightnessDown",
	"Brightness down",
	"omarchy-brightness-display 5%-",
	{ locked = true, repeating = true }
)
O.bind(
	"SHIFT + XF86MonBrightnessUp",
	"Brightness maximum",
	"omarchy-brightness-display 100%",
	{ locked = true, repeating = true }
)
O.bind(
	"SHIFT + XF86MonBrightnessDown",
	"Brightness minimum",
	"omarchy-brightness-display 1%",
	{ locked = true, repeating = true }
)
O.bind(
	"XF86KbdBrightnessUp",
	"Keyboard brightness up",
	"omarchy-brightness-keyboard up",
	{ locked = true, repeating = true }
)
O.bind(
	"XF86KbdBrightnessDown",
	"Keyboard brightness down",
	"omarchy-brightness-keyboard down",
	{ locked = true, repeating = true }
)
O.bind("XF86KbdLightOnOff", "Keyboard backlight cycle", "omarchy-brightness-keyboard cycle", { locked = true })
O.bind("XF86TouchpadToggle", "Toggle touchpad", "omarchy-toggle-touchpad", { locked = true })
O.bind("XF86TouchpadOn", "Enable touchpad", "omarchy-toggle-touchpad on", { locked = true })
O.bind("XF86TouchpadOff", "Disable touchpad", "omarchy-toggle-touchpad off", { locked = true })

-- Precise volume and brightness controls.
O.bind(
	"ALT + XF86AudioRaiseVolume",
	"Volume up precise",
	"omarchy-swayosd-client --output-volume +1",
	{ locked = true, repeating = true }
)
O.bind(
	"ALT + XF86AudioLowerVolume",
	"Volume down precise",
	"omarchy-swayosd-client --output-volume -1",
	{ locked = true, repeating = true }
)
O.bind(
	"ALT + XF86MonBrightnessUp",
	"Brightness up precise",
	"omarchy-brightness-display +1%",
	{ locked = true, repeating = true }
)
O.bind(
	"ALT + XF86MonBrightnessDown",
	"Brightness down precise",
	"omarchy-brightness-display 1%-",
	{ locked = true, repeating = true }
)

-- Media controls.
O.bind("XF86AudioNext", "Next track", "omarchy-swayosd-client --playerctl next", { locked = true })
O.bind("XF86AudioPause", "Pause", "omarchy-swayosd-client --playerctl play-pause", { locked = true })
O.bind("XF86AudioPlay", "Play", "omarchy-swayosd-client --playerctl play-pause", { locked = true })
O.bind("XF86AudioPrev", "Previous track", "omarchy-swayosd-client --playerctl previous", { locked = true })
