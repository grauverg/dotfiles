-- Custom functions
awful = require("awful")
beautiful = require("beautiful")

local functions = {}

function functions.get_available_wh(c)
	local screen = c.screen or mouse.screen
	local workarea = screen.workarea
	local gaps = beautiful.useless_gap or 5

	local available_width = workarea.width - (gaps * 2)
	local available_height = workarea.height - (gaps * 2)

	c:geometry({
		x = workarea.x + gaps,
		y = workarea.y + gaps,
		width = available_width,
		height = available_height,
	})
end

-- Функция для определения акцентных цветов
function functions.get_wal_color(line_num)
	local f = io.open(os.getenv("HOME") .. "/.cache/wal/colors", "r")
	if not f then
		return "#fe8019"
	end
	local colors = {}
	for line in f:lines() do
		table.insert(colors, line)
	end
	f:close()
	return colors[line_num]
end

function functions.enforce_zen_geometry(c)
	if c.class == "zen" or c.class == "Navigator" then
		client.disconnect_signal("property::geometry", functions.enforce_zen_geometry)
		functions.get_available_wh(c)
		client.connect_signal("property::geometry", functions.enforce_zen_geometry)
	end
end

function functions.run_autoload()
	-- start the script if it is not launched already
	awful.spawn.with_shell("flock -n /tmp/autostart.lock -c ~/.config/awesome/modules/autostart.sh")
end

return functions
