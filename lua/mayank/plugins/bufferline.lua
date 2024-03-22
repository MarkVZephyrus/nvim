return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "Tree",
						text_align = "left",
						separator = true,
					},
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				color_icons = true,
				separator_style = "slant",
				highlight = {
					underline = true,
					sp = "blue",
				},
			},
		})
	end,
}
