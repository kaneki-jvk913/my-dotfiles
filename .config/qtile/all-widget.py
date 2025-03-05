# 1. Current Layout
widget.CurrentLayout(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 2. Group Box
widget.GroupBox(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    active="#00ff00",     # Color for active group
    inactive="#555555",   # Color for inactive groups
    padding=5,            # Padding around the widget
),

# 3. Window Name
widget.WindowName(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 4. Prompt
widget.Prompt(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 5. Clock
widget.Clock(
    format="%Y-%m-%d %a %I:%M %p",  # Date and time format
    foreground="#ffffff",           # Text color
    background="#000000",           # Background color
    padding=5,                      # Padding around the widget
),

# 6. Systray
widget.Systray(
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 7. Battery
widget.Battery(
    format="{char} {percent:2.0%}",  # Display format
    foreground="#ffffff",            # Text color
    background="#000000",            # Background color
    padding=5,                       # Padding around the widget
),

# 8. CPU Usage
widget.CPU(
    format="CPU: {load_percent}%",  # Display format
    foreground="#ffffff",           # Text color
    background="#000000",           # Background color
    padding=5,                      # Padding around the widget
),

# 9. Memory Usage
widget.Memory(
    format="Mem: {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}",  # Display format
    foreground="#ffffff",                                  # Text color
    background="#000000",                                  # Background color
    padding=5,                                             # Padding around the widget
),

# 10. Volume Control
widget.Volume(
    fmt="Vol: {}",        # Display format
    foreground="#ffffff", # Text color
    background="#000000", # Background color
    padding=5,            # Padding around the widget
),

# 11. Network Status
widget.Net(
    format="{down} ↓↑ {up}",  # Display format
    foreground="#ffffff",     # Text color
    background="#000000",     # Background color
    padding=5,                # Padding around the widget
),

# 12. Keyboard Layout
widget.KeyboardLayout(
    configured_keyboards=["us", "ru"],  # List of keyboard layouts
    foreground="#ffffff",               # Text color
    background="#000000",               # Background color
    padding=5,                          # Padding around the widget
),

# 13. Task List
widget.TaskList(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 14. Quick Exit
widget.QuickExit(
    default_text="[X]",    # Display text
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 15. Spacer
widget.Spacer(
    length=10,  # Length of the spacer
),

# 16. Text Box
widget.TextBox(
    text="Hello, World!",  # Text to display
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 17. CPU Graph
widget.CPUGraph(
    foreground="#ffffff",  # Graph color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 18. Memory Graph
widget.MemoryGraph(
    foreground="#ffffff",  # Graph color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 19. Notifications
widget.Notify(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 20. Chords (Keybindings)
widget.Chord(
    chords_colors={
        "launch": ("#ff0000", "#ffffff"),  # Chord colors
    },
    name_transform=lambda name: name.upper(),  # Transform chord names
    foreground="#ffffff",                      # Text color
    background="#000000",                      # Background color
    padding=5,                                 # Padding around the widget
),

# 21. Weather (OpenWeatherMap)
widget.OpenWeather(
    cityid="YOUR_CITY_ID",  # OpenWeatherMap city ID
    format="{main_temp}°C", # Display format
    foreground="#ffffff",   # Text color
    background="#000000",   # Background color
    padding=5,              # Padding around the widget
),

# 22. Updates (Pacman, Apt, etc.)
widget.CheckUpdates(
    distro="Arch",          # Distribution (e.g., Arch, Ubuntu)
    foreground="#ffffff",   # Text color
    background="#000000",   # Background color
    padding=5,              # Padding around the widget
),

# 23. Backlight Control
widget.Backlight(
    backlight_name="intel_backlight",  # Backlight device name
    foreground="#ffffff",              # Text color
    background="#000000",              # Background color
    padding=5,                         # Padding around the widget
),

# 24. Sensors (Temperature, Fan, etc.)
widget.ThermalSensor(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 25. Mpris2 (Media Player Control)
widget.Mpris2(
    name="spotify",        # Player name
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 26. Keyboard LED Indicators
widget.KeyboardLED(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 27. Wttr.in Weather
widget.Wttr(
    location="New York",   # Location for weather
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 28. Custom Scripts
widget.GenPollText(
    func=lambda: subprocess.check_output("your_script.sh").decode("utf-8"),
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 29. Separator
widget.Sep(
    linewidth=2,           # Line thickness
    foreground="#ffffff",  # Line color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 30. Image
widget.Image(
    filename="~/.config/qtile/icon.png",  # Path to image
    foreground="#ffffff",                 # Text color
    background="#000000",                # Background color
    padding=5,                           # Padding around the widget
),

# 31. Pomodoro Timer
widget.Pomodoro(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 32. Clipboard
widget.Clipboard(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 33. Countdown Timer
widget.Countdown(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),

# 34. Gmail Checker
widget.GmailChecker(
    email="your_email@gmail.com",  # Gmail address
    password="your_password",      # App password
    foreground="#ffffff",          # Text color
    background="#000000",          # Background color
    padding=5,                     # Padding around the widget
),

# 35. Bitcoin Price
widget.BitcoinTicker(
    foreground="#ffffff",  # Text color
    background="#000000",  # Background color
    padding=5,             # Padding around the widget
),
