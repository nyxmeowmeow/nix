{ inputs, ... }: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    # runAsService = true;
    theme = "meow";
    config = ''
app_launch_prefix = ""
terminal_title_flag = ""
locale = ""
close_when_open = false
monitor = ""
hotreload_theme = true
as_window = false
timeout = 0
disable_click_to_close = false
force_keyboard_focus = true

[keys]
accept_typeahead = ["tab"]
trigger_labels = "lalt"
next = ["down"]
prev = ["up"]
close = ["esc"]
remove_from_history = ["shift backspace"]
resume_query = ["ctrl r"]
toggle_exact_search = ["ctrl m"]

[keys.activation_modifiers]
keep_open = "shift"
alternate = "alt"

[list]
dynamic_sub = true
keyboard_scroll_style = "emacs"
max_entries = 20
show_initial_entries = false
single_click = true
visibility_threshold = 100
placeholder = ""

[search]
argument_delimiter = "#"
placeholder = "meow"
delay = 0
resume_last_query = false

[activation_mode]
disabled = true
# labels = "shtareni"

[builtins.applications]
weight = 5
name = "applications"
placeholder = "Applications"
prioritize_new = true
hide_actions_with_empty_query = true
context_aware = true
refresh = true
show_sub_when_single = true
show_icon_when_single = true
show_generic = true
history = true

[builtins.applications.actions]
enabled = true
hide_category = false
hide_without_query = true

[builtins.bookmarks]
weight = 5
placeholder = "Bookmarks"
name = "bookmarks"
icon = "bookmark"
switcher_only = true

[[builtins.bookmarks.entries]]
label = "github"
url = "https://github.com/notifications"
keywords = ["github"]

[[builtins.bookmarks.entries]]
label = "nixpkgs search"
url = "https://search.nixos.org/packages?channel=unstable"
keywords = ["nix"]

[[builtins.bookmarks.entries]]
label = "home-manager search"
url = "https://hm-search.kothavade.com/"
keywords = ["nix"]

[[builtins.bookmarks.entries]]
label = "nixos option search"
url = "https://search.nixos.org/options?channel=unstable"
keywords = ["nix"]

[[builtins.bookmarks.entries]]
label = "nixvim search"
url = "https://nix-community.github.io/nixvim/search"
keywords = ["nix"]

[builtins.calc]
require_number = true
weight = 5
name = "calc"
icon = "accessories-calculator"
placeholder = "Calculator"
min_chars = 4

[builtins.windows]
weight = 5
icon = "view-restore"
name = "windows"
placeholder = "Windows"
show_icon_when_single = true

[builtins.clipboard]
always_put_new_on_top = true
exec = "wl-copy"
weight = 5
name = "clipboard"
avoid_line_breaks = true
placeholder = "Clipboard"
image_height = 300
max_entries = 10
switcher_only = true

[builtins.commands]
weight = 5
icon = "utilities-terminal"
switcher_only = true
name = "commands"
placeholder = "Commands"

[builtins.custom_commands]
weight = 5
icon = "utilities-terminal"
name = "custom_commands"
placeholder = "Custom Commands"

    '';
  };
}
