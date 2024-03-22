return {
	"gelguy/wilder.nvim",
	dependencies = {
		"romgrk/fzy-lua-native",
	},
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":" } })
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
				highlighter = {
					wilder.lua_pcre2_highlighter(),
					wilder.lua_fzy_highlighter(),
				},
				-- 'single', 'double', 'rounded' or 'solid'
				-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
				border = "rounded",
				min_width = "20%",
				max_width = "30%",
				max_height = "50%", -- max height of the palette
				min_height = 0, -- set to the same as 'max_height' for a fixed height window
				prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
				reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
			}))
		)
	end,
}
