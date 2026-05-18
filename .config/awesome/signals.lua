-- Signals
local awful = require("awful")
local beautiful = require("beautiful")
local functions = require("functions")
local mytitlebar = require("titlebar")

-- Signal function to execute when a new client appears
client.connect_signal("manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)
client.connect_signal("request::titlebars", mytitlebar.setup)

-- Signal to
client.connect_signal("property::geometry", functions.enforce_zen_geometry)

-- signal that changes focus border colors
client.connect_signal("focus", function(c)
	c.border_color = functions.get_wal_color(2)
end)
client.connect_signal("unfocus", function(c)
	c.border_color = "#00000000"
end)

return true
