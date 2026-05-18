-- Awesome Menu
local awful = require("awful")

local hotkeys_popup = require("awful.hotkeys_popup")

mymainmenu = awful.menu({
	items = {
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", "man awesome" },
	{ "edit config", "nvim awconf" },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
})
