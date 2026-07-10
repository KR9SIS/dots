require("bindings.media")
require("bindings.clipboard")
require("bindings.tiling-v2")
require("bindings.utilities")

-- Application bindings without Omarchy's preinstalled web apps, TUIs, or desktop apps.
O.bind("SUPER + RETURN", "Terminal", { omarchy = "terminal" })
O.bind("SUPER + SHIFT + RETURN", "Browser", { omarchy = "browser" })
O.bind("SUPER + SHIFT + F", "File manager", { omarchy = "nautilus" })
O.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { omarchy = "nautilus-cwd" })
O.bind("SUPER + SHIFT + B", "Browser", { omarchy = "browser" })
O.bind("SUPER + SHIFT + ALT + B", "Browser (private)", { omarchy = "browser --private" })
