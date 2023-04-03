vim.opt.termguicolors = true
require("bufferline").setup{
	options = {
		mode = "tabs",
		numbers = "ordinal",
		diagnostics = "coc",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true
			}
		},
		color_icons = true,
		separator_style = "slope"
	}
}
