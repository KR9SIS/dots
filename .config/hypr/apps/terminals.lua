-- Define terminal tag to style them uniformly.
O.window("(Alacritty|kitty|com.mitchellh.ghostty|foot)", { tag = "+terminal" })
O.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "0.97 0.9" })
