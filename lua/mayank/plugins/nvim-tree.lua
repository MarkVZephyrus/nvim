return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "󰉖", -- arrow when folder is closed
							arrow_open = "󰷏", -- arrow when folder is open
						},
					},
				},
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				-- dotfiles = true,
			},
		})

		vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>")

		-- Autosessions compatibility
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = "NvimTree*",
			callback = function()
				local api = require("nvim-tree.api")
				local view = require("nvim-tree.view")

				if not view.is_visible() then
					api.tree.open()
				end
			end,
		})
	end,
}
