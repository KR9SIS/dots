O.window({ tag = "floating-window" }, { float = true, center = true, size = { 875, 600 } })

O.window(
	"(org.omarchy.bluetui|org.omarchy.impala|org.omarchy.wiremix|org.omarchy.btop|org.omarchy.terminal|org.omarchy.bash|org.codeberg.dnkl.foot|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|Omarchy|About|TUI.float|imv|mpv)",
	{ tag = "+floating-window" }
)
O.window(
	{
		class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
		title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
	},
	{ tag = "+floating-window" }
)
O.window("org.gnome.Calculator", { float = true })

-- Screen saver should always cover the screen and not be tiled.
O.window("org.omarchy.screensaver", { fullscreen = true, float = true, animation = "slide" })

-- Media/image/video apps should be opaque.
O.window(
	"^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$",
	{ tag = "-default-opacity", opacity = "1 1" }
)

-- Common app-controlled tags.
O.window({ tag = "pop" }, { rounding = 8 })
O.window({ tag = "noidle" }, { idle_inhibit = "always" })

-- Disable animations for image selector overlay.
hl.layer_rule({ match = { namespace = "omarchy-image-selector" }, no_anim = true })
