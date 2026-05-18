pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

require("awful.autofocus")

local functions = require("functions")
local keybindings = require("bindings")

local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

local myrules = require("rules")

require("awful.hotkeys_popup.keys")
require("error_handling")

-- variable definitions
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.spiral,
}

awful.screen.connect_for_each_screen(function(s)
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end)

-- mouse and key bindings
globalkeys = keybindings.get_global_keys()
clientkeys = keybindings.get_client_keys()
clientbuttons = keybindings.get_client_buttons()

root.keys(globalkeys)
root.buttons(keybindings.get_buttons())

-- rules
awful.rules.rules = myrules.get()

-- signals
require("signals")

beautiful.useless_gap = 5

-- autoload
awful.spawn.with_shell("picom -b")
awful.spawn.with_shell("xbindkeys -f /home/vsevolod/.xbindkeysrc")
awful.spawn.with_shell("/home/vsevolod/change_theme.sh")
awful.spawn.with_shell("start-pulseaudio-x11")
awful.spawn.with_shell("/home/vsevolod/.config/polybar/launch.sh")
