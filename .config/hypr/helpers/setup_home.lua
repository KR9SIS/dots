local function wait_for_window(class, title, callback, timeout_ms, interval_ms)
	timeout_ms = timeout_ms or 10000 -- Default 10s total timeout
	interval_ms = interval_ms or 100

	local elapsed = 0
	local timer_handle

	local function rec_check()
		for _, w in ipairs(hl.get_windows()) do
			if w.class == class and w.title and w.title:find(title, 1, true) then
				if timer_handle then
					timer_handle:cancel()
				end
				callback(w)
				return
			end
		end

		elapsed = elapsed + interval_ms
		if elapsed >= timeout_ms then
			if timer_handle then
				timer_handle:cancel()
			end
			callback(nil)
			return
		end

		timer_handle = hl.timer(rec_check, { timeout = interval_ms, type = "oneshot" })
	end

	rec_check()
end

local function setup_app(workspace, monitor, class, title)
	wait_for_window(class, title, function(window)
		if window then
			print(title .. " found")
			hl.dispatch(hl.dsp.window.move({ workspace = workspace, window = "address:" .. window.address }))
		else
			print(title .. " not found, timeout reached")
		end

		-- Check for multi monitor setup and move workspace if needed
		if #hl.get_monitors() > 1 then
			hl.dispatch(hl.dsp.workspace.move({ workspace = workspace, monitor = monitor }))
		end
	end)
end

function SETUP_HOME()
	setup_app(1, 1, "brave-browser", "- Brave")
	setup_app(2, 0, "Alacritty", "Alacritty")

	hl.dispatch(hl.dsp.focus({ workspace = 1 }))
end
