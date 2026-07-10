local function setup_app(workspace, monitor, class, title_pattern)
	hl.on("window.open", function(window)
		-- Early returns for non-matching windows
		if window.class ~= class then
			return
		end
		if not window.title:lower():find(title_pattern:lower()) then
			return
		end

		-- Move window to target workspace
		hl.dispatch(hl.dsp.window.move({ workspace = workspace, window = "address:" .. window.address }))

		-- Check for multi monitor setup and move workspace if needed
		if #hl.get_monitors() > 1 then
			hl.dispatch(hl.dsp.workspace.move({ workspace = workspace, monitor = monitor }))
		end
	end)
end

setup_app(1, 1, "brave-browser", "New tab - Brave")
setup_app(2, 0, "Alacritty", "Alacritty")

hl.dispatch(hl.dsp.focus({ workspace = 1 }))
