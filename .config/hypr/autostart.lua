-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
require("helpers.setup_home")

hl.on("hyprland.start", function()
	O.launch(BROWSER)
	hl.exec_cmd("tmux new -s NixOS -d")
	O.launch(TERM, "-T")

	hl.timer(SETUP_HOME, { type = "oneshot", timeout = 1000 })
end)
