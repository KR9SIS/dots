-- Shared helpers for Hyprland Lua configuration.

O = O or {}

local function shell_quote(value)
	return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

function O.launch_or_focus(cmd)
	local function has_tag(w, tag)
		if type(w.tags) ~= "table" then
			return false
		end

		for _, t in ipairs(w.tags) do
			if t == tag or t:find(tag, 1, true) then
				return true
			end
		end

		return false
	end

	local tag = cmd.class or cmd.tag or cmd.focus
	for _, w in ipairs(hl.get_windows()) do
		if
			(cmd.class and w.class:find(cmd.class, 1, true)) --Optionally match on class
			or has_tag(w, tag) and (cmd.ws == nil or w.workspace.id == cmd.ws) -- Otherwise match on tag
		then
			hl.dispatch(hl.dsp.focus({ window = w }))
			return
		end
	end

	if cmd.ws then
		hl.dispatch(hl.dsp.focus({ workspace = cmd.ws }))
	end

	local sub
	local timeout_timer

	sub = hl.on("window.open", function(w)
		if cmd.class and not w.class:find(cmd.class, 1, true) then
			return
		end
		hl.dispatch(hl.dsp.window.tag({ tag = "+" .. tag, window = w }))

		if sub then
			sub:remove()
		end
		if timeout_timer then
			timeout_timer:set_enabled(false)
		end
	end)

	timeout_timer = hl.timer(function()
		if sub then
			sub:remove()
		end
	end, { timeout = 5000, type = "oneshot" })

	hl.exec_cmd(O.launch_cmd(cmd.focus, cmd.uwsm_args, cmd.args))
end

local function command_from(value)
	if type(value) ~= "table" then
		return value
	end

	if value.omarchy then
		return "omarchy-launch-" .. value.omarchy
	elseif value.focus then
		return function()
			O.launch_or_focus(value)
		end
	elseif value.launch or value.uwsm_args then
		return O.launch_cmd(value.launch, value.uwsm_args, value.args)
	end

	return "omarchy-notification-send 'Error: Keybind misconfigured' -g  "
end

function O.bind(keys, description, dispatcher, options)
	local opts = options or {}

	if type(dispatcher) == "table" and dispatcher.launchall then
		for _, dsp in ipairs(dispatcher.launchall) do
			O.bind(keys, description, dsp, options)
		end
		return
	end

	if description then
		opts.description = description
	end

	dispatcher = command_from(dispatcher)

	if type(dispatcher) == "string" then
		dispatcher = hl.dsp.exec_cmd(dispatcher)
	end

	hl.bind(keys, dispatcher, opts)
end

function O.launch(command, uwsm_args, args)
	hl.exec_cmd(O.launch_cmd(command, uwsm_args, args))
end

function O.launch_cmd(command, uwsm_args, args)
	uwsm_args = uwsm_args or ""
	command = command or ""
	args = args or ""
	return "uwsm app " .. uwsm_args .. " -- " .. command .. " " .. args
end

function O.bind_menu(keys, description, menu, options)
	O.bind(keys, description, menu and ("omarchy-menu " .. menu) or "omarchy-menu", options)
end

function O.bind_toggle(keys, description, toggle, options)
	O.bind(keys, description, "omarchy-toggle-" .. toggle, options)
end

function O.notify(message)
	return "omarchy-notification-send " .. shell_quote(message)
end

function O.window(match, rules)
	rules.match = rules.match or {}

	if type(match) == "string" then
		rules.match.class = match
	else
		for key, value in pairs(match) do
			rules.match[key] = value
		end
	end

	hl.window_rule(rules)
end
