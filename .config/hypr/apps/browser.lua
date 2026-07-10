-- Browser tags and styling.
O.window(
	"((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)",
	{ tag = "+chromium-based-browser" }
)
O.window("([fF]irefox|zen|librewolf)", { tag = "+firefox-based-browser" })
O.window({ tag = "chromium-based-browser" }, { tag = "-default-opacity", tile = true, opacity = "1.0 0.97" })
O.window({ tag = "firefox-based-browser" }, { tag = "-default-opacity", opacity = "1.0 0.97" })

-- Video apps: remove chromium browser tag so they don't get opacity applied.
O.window("(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)", { tag = "-chromium-based-browser" })
O.window("(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)", { tag = "-default-opacity" })

-- Hide screen sharing notification windows.
O.window({ title = ".*is sharing.*" }, { workspace = "special silent" })
