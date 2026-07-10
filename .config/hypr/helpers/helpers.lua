-- Shared helpers for Hyprland Lua configuration.

O = O or {}

local function shell_quote(value)
	return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

local function command_from(value, description)
	if type(value) ~= "table" then
		return value
	end

	if value.omarchy then
		return "omarchy-launch-" .. value.omarchy
	elseif value.focus and value.launch then
		return O.launch_sole(value.focus, value.launch)
	elseif value.launch then
		return O.launch(value.launch)
	elseif value.webapp then
		if value.focus then
			return O.launch_webapp_sole(description, value.webapp)
		else
			return O.launch_webapp(value.webapp)
		end
	elseif value.tui then
		if value.focus then
			return "omarchy-launch-or-focus-tui " .. shell_quote(value.tui)
		else
			return "omarchy-launch-tui " .. shell_quote(value.tui)
		end
	end

	return value
end

-- Get reference metatable at module load time (side-effect-free, just constructs a dispatcher)
local hypr_dsp_mt = getmetatable(hl.dsp.window.close())
function O.bind(keys, description, dispatcher, options)
	local opts = options or {}

	if description then
		opts.description = description

		-- Identify hl.dsp objects
		if getmetatable(dispatcher) == hypr_dsp_mt then
			opts.description = "Hypr: " .. opts.description
		end
	end

	dispatcher = command_from(dispatcher, description)

	if type(dispatcher) == "string" then
		dispatcher = hl.dsp.exec_cmd(dispatcher)
	end

	hl.bind(keys, dispatcher, opts)
end

function O.launch(command)
	return "uwsm-app -- " .. command
end

function O.exec_on_start(command)
	hl.on("hyprland.start", function()
		hl.exec_cmd(command)
	end)
end

function O.launch_on_start(command)
	O.exec_on_start(O.launch(command))
end

function O.launch_webapp(url)
	return "omarchy-launch-webapp " .. shell_quote(url)
end

function O.launch_webapp_sole(name, url)
	return "omarchy-launch-or-focus-webapp " .. shell_quote(name) .. " " .. shell_quote(url)
end

function O.launch_sole(match, command)
	return "omarchy-launch-or-focus " .. shell_quote(match) .. " " .. shell_quote(O.launch(command))
end

function O.bind_menu(keys, description, menu, options)
	O.bind(keys, description, menu and ("omarchy-menu " .. menu) or "omarchy-menu", options)
end

function O.bind_toggle(keys, description, toggle, options)
	O.bind(keys, description, "omarchy-toggle-" .. toggle, options)
end

function O.notify(message)
	return "notify-send -u low " .. shell_quote(message)
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
