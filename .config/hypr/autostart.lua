-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	hl.exec_cmd("tmux new -s NixOS -d")
	O.launch_or_focus({ focus = "launch-tmux", ws = 2, uwsm_args = "-T", args = TERM, class = TERM })
	O.launch_or_focus({ focus = BROWSER, ws = 1, class = BROWSER })
end)
