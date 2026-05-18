-- Rules
local awful = require("awful")
local beautiful = require("beautiful")
local functions = require("functions")

local rules = {}

function rules.get()
	return {
		{
			rule = {},
			properties = {
				border_width = 2,
				border_color = beautiful.border_normal,
				focus = awful.client.focus.filter,
				raise = true,
				keys = clientkeys,
				buttons = clientbuttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			},
		},

		-- Floating clients.
		{
			rule_any = {
				instance = {
					"DTA", -- Firefox addon DownThemAll.
					"copyq", -- Includes session name in class.
					"pinentry",
				},
				class = {
					"Arandr",
					"Blueman-manager",
					"Gpick",
					"Kruler",
					"MessageWin",
					"Sxiv",
					"Tor Browser",
					"Wpa_gui",
					"veromix",
					"xtightvncviewer",
				},
				name = {
					"Event Tester",
				},
				role = {
					"AlarmWindow",
					"ConfigManager",
					"pop-up",
				},
			},
			properties = { floating = true },
		},
		{
			-- правило настройки polybar
			rule = { class = "Polybar" },
			properties = {
				border_width = 0,
				focusable = false,
				focus = false,
				raise = true,
			},
		},
		{
			-- правило для учета beautiful.useless_gap
			rule_any = { class = "libreoffice" },
			properties = {
				floating = true,
				placement = functions.get_available_wh,
			},
		},
		{
			rule_any = { class = { "zen", "Navigator" } },
			properties = {
				floating = true,
			},
		},
	}
end

return rules
