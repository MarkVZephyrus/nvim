return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			scope = {
				enabled = true,
				-- char = "▎",
				show_start = true,
				show_end = false,
				injected_languages = true,
				-- highlight = { "Function", "Label" },
				priority = 500,
			},
			indent = {
				char = "▏", -- ║
				smart_indent_cap = true,
				-- highlight = { "Function", "Label" },
			},
		})
	end,
}
