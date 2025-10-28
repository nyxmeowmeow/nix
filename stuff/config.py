bg = "#000000"
fg = "#f2f1ef"
fg2 = "#C5C9C7"
red = "#C34043"
blue = "#7FB4CA"
green = "#98BB6C"
violet = "#938AA9"
yellow = "#E6C384"

c.aliases = {
    "o": "open",
    "on": "open -t",
    "tab": "tab-focus"
}


config.unbind("gt")

config.bind("p", "undo")
config.bind("o", "tab-close -n")
config.bind("O", "tab-close -o")
config.bind("go", "cmd-set-text -s :tab-close")

config.bind("gi", "tab -1")
config.bind("ga", "tab -1")
config.bind("gh", "tab 1")
config.bind("ge", "tab 1")
config.bind("gc", "tab-clone")
config.bind("gr", "navigate strip")
config.bind("gR", "navigate strip -t")
config.bind("gm", "cmd-set-text -s :tab-move")


config.bind("<Ctrl-h>", "tab-move -")
config.bind("<Ctrl-i>", "tab-move +")
config.bind("<Ctrl-Shift-H>", "tab-move 1")
config.bind("<Ctrl-Shift-I>", "tab-move -1")

config.bind("m", "next")
config.bind("v", "quickmark-save")
config.bind("r", "mode-enter caret")


config.bind("<Enter>", "hint")

config.bind("<Ctrl-t>", ":back")
config.bind("<Ctrl-c>", ":forward")
config.bind("<Ctrl-T>", ":back -t")
config.bind("<Ctrl-C>", ":forward -t")

config.bind("s", "cmd-set-text -s :o")
config.bind("t", "cmd-set-text -s :tab")
config.bind("c", "cmd-set-text -s :on")

config.bind("a", "scroll-page 0 0.5")
config.bind("e", "scroll-page 0 -0.5")
config.bind("h", "tab-prev")
config.bind("i", "tab-next")
config.bind("<Ctrl-a>", "scroll down")
config.bind("<Ctrl-e>", "scroll up")
config.bind("A", "scroll down")
config.bind("E", "scroll up")


config.bind("n", "mode-enter insert")


config.bind("<Space>u", "edit-url") # todo float and window size


config.unbind("j")
config.unbind("k")
config.bind("jd", "yank domain")
config.bind("jm", "yank inline [{title}]({url:rank})")
config.bind("jp", "yank pretty-url")
config.bind("jt", "yank title")
config.bind("jj", "yank")








c.content.autoplay = False














# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{upstream_browser_version_short}`: The
# corresponding Safari/Chrome   version, but only with its major
# version. * `{qutebrowser_version}`: The currently running qutebrowser
# version.  The default value is equal to the default user agent of
# QtWebKit/QtWebEngine, but with the `QtWebEngine/...` part removed for
# increased compatibility.  Note that the value read from JavaScript is
# always the global value.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:136.0) Gecko/20100101 Firefox/139.0', 'https://accounts.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
# Type: Bool
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/meow/.local/share/qutebrowser/userscripts/*')

# Allow locally loaded documents to access other local URLs.
# Type: Bool
config.set('content.local_content_can_access_file_urls', False, 'file:///home/meow/.local/share/qutebrowser/userscripts/*')

# Enable plugins in Web pages.
# Type: Bool
config.set('content.plugins', True, '*://start.duckduckgo.com/*')

c.window.transparent = True
c.completion.cmd_history_max_items = -1
c.completion.height = "33%"


# c.confirm_quit = "downloads"
c.content.blocking.method = "both"

c.tabs.position = 'left'
c.tabs.wrap = True
c.tabs.width = 200

c.colors.tabs.bar.bg = "#000000"
c.colors.tabs.indicator.start = "transparent"
c.colors.tabs.indicator.stop = "transparent"


c.colors.tabs.even.bg = "transparent"
# c.colors.tabs.even.fg = "transparent"
c.colors.tabs.odd.bg = "transparent"
# c.colors.tabs.odd.fg = "transparent"

c.colors.tabs.selected.even.bg = blue
c.colors.tabs.selected.even.fg = bg
c.colors.tabs.selected.odd.bg = blue
c.colors.tabs.selected.odd.fg = bg




c.colors.tooltip.bg = "#000000cc"
c.colors.tooltip.fg = fg


c.fonts.default_size = "18px"

c.hints.border = "none"
c.hints.chars = "nstcieahr"

# c.hints.find_implementation = "javascript" # slower
c.hints.find_implementation = "python"

# c.keyhint.blacklist = []


c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = False
c.downloads.location.remember = False
c.downloads.position = "top"
c.downloads.remove_finished = -1

c.editor.command = [ "foot", "nvim", "{file}" ]

c.fileselect.folder.command = [ "foot", "yazi", "--chooser-file={}" ]
c.fileselect.single_file.command = [ "foot", "yazi", "--chooser-file={}" ]
c.fileselect.multiple_files.command = [ "foot", "yazi", "--chooser-file={}" ]
c.fileselect.handler = "external"


c.input.forward_unbound_keys = "auto"
# c.input.insert_mode.auto_load = "true"





c.colors.downloads.bar.bg = bg
c.colors.downloads.error.bg = bg
c.colors.downloads.start.bg = bg
c.colors.downloads.stop.bg = bg

c.colors.downloads.error.fg = red
c.colors.downloads.start.fg = blue
c.colors.downloads.stop.fg = green
c.colors.downloads.system.fg = "none"
c.colors.downloads.system.bg = "none"


## Background color of the completion widget category headers.
c.colors.completion.category.bg = bg
## Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = bg
## Top border color of the completion widget category headers.
c.colors.completion.category.border.top = bg
## Foreground color of completion widget category headers.
c.colors.completion.category.fg = blue
c.colors.completion.even.bg = bg
c.colors.completion.odd.bg = bg
## Text color of the completion widget.
c.colors.completion.fg = fg2

## Background color of the selected completion item.
c.colors.completion.item.selected.bg = blue
## Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = bg
## Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = bg
## Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = bg
## Foreground color of the selected completion item.
c.colors.completion.item.selected.match.fg = bg
## Foreground color of the matched text in the completion.
c.colors.completion.match.fg = blue

## Color of the scrollbar in completion view
c.colors.completion.scrollbar.bg = bg
## Color of the scrollbar handle in completion view.
c.colors.completion.scrollbar.fg = bg



c.colors.hints.bg = blue
c.colors.hints.fg = bg
c.colors.hints.match.fg = blue

c.colors.keyhint.bg = bg
c.colors.keyhint.fg = fg
c.colors.keyhint.suffix.fg = blue















## Background color for prompts.
c.colors.prompts.bg = bg

# ## Border used around UI elements in prompts.
# c.colors.prompts.border = "1px solid " + palette["overlay0"]

## Foreground color for prompts.
c.colors.prompts.fg = fg

## Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = blue

# statusbar {{{
## Background color of the statusbar.
c.colors.statusbar.normal.bg = bg
## Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = bg
## Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = bg
## Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = bg
## Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = bg

## Background color of the progress bar.
c.colors.statusbar.progress.bg = bg
## Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = bg

## Foreground color of the statusbar.
c.colors.statusbar.normal.fg = fg
## Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = blue
## Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = blue
## Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = blue
## Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = violet
## Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = violet

c.colors.statusbar.url.error.fg = red
c.colors.statusbar.url.fg = blue

## Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = violet

c.colors.statusbar.url.success.http.fg = blue
c.colors.statusbar.url.success.https.fg = blue
c.colors.statusbar.url.warn.fg = yellow

## PRIVATE MODE COLORS
## Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = bg
## Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = violet
## Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = bg
## Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = violet

# context menus {{{
c.colors.contextmenu.menu.bg = bg
c.colors.contextmenu.menu.fg = fg

c.colors.contextmenu.disabled.bg = bg
c.colors.contextmenu.disabled.fg = fg2

c.colors.contextmenu.selected.bg = blue
c.colors.contextmenu.selected.fg = bg
