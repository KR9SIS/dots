MODKEY = "SUPER"

require("bindings.media")
require("bindings.clipboard")
require("bindings.tiling-v2")
require("bindings.utilities")

-- Application bindings without Omarchy's preinstalled web apps, TUIs, or desktop apps.
O.bind(MODKEY .. " + RETURN", "Terminal", { omarchy = "terminal" })
O.bind(MODKEY .. " + SHIFT + RETURN", "Browser", { omarchy = "browser" })
O.bind(MODKEY .. " + SHIFT + F", "File manager", { omarchy = "nautilus" })
O.bind(MODKEY .. " + ALT + SHIFT + F", "File manager (cwd)", { omarchy = "nautilus-cwd" })
O.bind(MODKEY .. " + SHIFT + B", "Browser", { omarchy = "browser" })
O.bind(MODKEY .. " + SHIFT + ALT + B", "Browser (private)", { omarchy = "browser --private" })
