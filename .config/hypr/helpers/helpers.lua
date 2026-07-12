-- Shared helpers for Hyprland Lua configuration.

O = O or {}

local function shell_quote(value)
	return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

local function launch_or_focus(workspace, app, class)
	for _, w in ipairs(hl.get_windows()) do
		if w.class and w.class:find(class, 1, true) then
			if w.workspace.id == workspace then
				hl.dispatch(hl.dsp.focus({ workspace = workspace }))
				return
			end
		end
	end
	hl.dispatch(hl.dsp.focus({ workspace = workspace }))
	hl.dispatch(hl.dsp.exec_cmd(app))
end

local function command_from(value)
	if type(value) ~= "table" then
		return value
	end

	if value.omarchy then
		return "omarchy-launch-" .. value.omarchy
	elseif value.ws and value.app and value.class then
		return function()
			launch_or_focus(value.ws, O.launch_cmd(value.app, value.uwsm_args, value.args), value.class)
		end
	end

	return O.launch_cmd(value.launch, value.uwsm_args, value.args)
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
