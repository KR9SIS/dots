-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	hl.exec_cmd(TERM .. "-tmux")
	hl.exec_cmd(BROWSER)
	require("helpers.setup_home")
end)

-- Omarchy version: o.exec_on_start("setup_home.sh")
