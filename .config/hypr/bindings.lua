require("bindings.media")
require("bindings.clipboard")
require("bindings.tiling")
require("bindings.utilities")
require("bindings.apps")

-- Application bindings without Omarchy's preinstalled web apps, TUIs, or desktop apps.
O.bind("SUPER + RETURN", "Terminal", { uwsm_args = "-T" })
O.bind("SUPER + SHIFT + F", "File manager", { omarchy = "nautilus" })
O.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { omarchy = "nautilus-cwd" })
O.bind("SUPER + SHIFT + B", "Browser", { launch = BROWSER })
O.bind("SUPER + SHIFT + ALT + B", "Browser (private)", { launch = BROWSER, args = "--incognito" })
