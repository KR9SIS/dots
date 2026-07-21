O.bind("SUPER + code:10", "Focus Browser", { ws = 1, focus = BROWSER })

O.bind(
	"SUPER + code:11",
	"Focus Terminal",
	{ ws = 2, focus = "launch-tmux", uwsm_args = "-T", args = TERM, tag = TERM }
)

O.bind("SUPER + code:17", "Focus Signal", { ws = 8, focus = "signal.desktop" })

O.bind("SUPER + code:18", "Focus Spotify", { ws = 9, focus = "Spotify.desktop" })
