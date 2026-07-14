-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	hl.exec_cmd("tmux new -s NixOS -d")
	hl.timer(function()
		hl.exec_cmd("tmux send-keys -t NixOS 'cd nixos && clear' Enter")
	end, { type = "oneshot", timeout = 5000 })
	O.launch_or_focus({ focus = "launch-tmux", ws = 2, uwsm_args = "-T", args = TERM .. " cf", class = TERM })
	O.launch_or_focus({ focus = BROWSER, ws = 1, class = BROWSER })
end)
