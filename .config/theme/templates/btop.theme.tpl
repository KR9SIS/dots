# Main background, empty for terminal default, need to be empty if you want transparent background
theme[main_bg]="{{ background }}"

# Main text color
theme[main_fg]="{{ foreground }}" #

# Title color for boxes
theme[title]="{{ foreground }}" #

# Highlight color for keyboard shortcuts
theme[hi_fg]="{{ color1 }}" #

# Background color of selected item in processes box
theme[selected_bg]="{{ selection_background }}" #

# Foreground color of selected item in processes box
theme[selected_fg]="{{ selection_foreground }}"

# Color of inactive/disabled text
theme[inactive_fg]="{{ color8 }}" #

# Color of text appearing on top of graphs, i.e uptime and current network graph scaling
theme[graph_text]="{{ color14 }}" #

# Background color of the percentage meters
theme[meter_bg]="{{ color8 }}"

# Misc colors for processes box including mini cpu graphs, details memory graph and details status text
theme[proc_misc]="{{ color14 }}"

# CPU, Memory, Network, Proc box outline colors
theme[cpu_box]="{{ color8 }}"
theme[mem_box]="{{ color8 }}"
theme[net_box]="{{ color8 }}"
theme[proc_box]="{{ color8 }}"

# Box divider line and small boxes line color
theme[div_line]="{{ color8 }}"

# Temperature graph color (Green -> Yellow -> Red)
theme[temp_start]="{{ color10 }}"
theme[temp_mid]="{{ selection_foreground }}"
theme[temp_end]="{{ color9 }}"

# CPU graph colors (Green -> Yellow -> Red)
theme[cpu_start]="{{ color10 }}"
theme[cpu_mid]="{{ selection_foreground }}"
theme[cpu_end]="{{ color9 }}"

# Mem/Disk free meter (Yellow -> Red -> Dark Red)
theme[free_start]="{{ selection_foreground }}"
theme[free_mid]="{{ color9 }}"
theme[free_end]="{{ color1 }}"

# Mem/Disk cached meter (Golden -> Orange)
theme[cached_start]="{{ color3 }}"
theme[cached_mid]="{{ selection_foreground }}"
theme[cached_end]="{{ color16 }}"

# Mem/Disk available meter (Peach -> Red)
theme[available_start]="{{ color13 }}"
theme[available_mid]="{{ color5 }}"
theme[available_end]="{{ color4 }}"

# Mem/Disk used meter (Green -> Sky)
theme[used_start]="{{ color6 }}"
theme[used_mid]="{{ accent }}"
theme[used_end]="{{ color12 }}"

# Download graph colors (Peach -> Red)
theme[download_start]="{{ accent }}"
theme[download_mid]="{{ color13 }}"
theme[download_end]="{{ color4 }}"

# Upload graph colors (Green -> Sky)
theme[upload_start]="{{ selection_foreground }}"
theme[upload_mid]="{{ color11 }}"
theme[upload_end]="{{ color9 }}"

# Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
theme[process_start]="{{ color10 }}"
theme[process_mid]="{{ selection_foreground }}"
theme[process_end]="{{ color9 }}"
