return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local logo = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}
		dashboard.section.header.val = logo

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "     New File", "<cmd>ene<CR>"),
			dashboard.button("E", "     Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("n", "󰱼     Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("r", "     Recents", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("S", "     Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "     Quit NVIM", "<cmd>qa<CR>"),
		}

		-- local fortune = require("alpha.fortune") -- not as fun as the startify cow
		dashboard.section.footer.val = "🌕 Try not to config. 🌑" -- fortune()

		-- alpha.setup(require("alpha.themes.startify").config)
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- hide statusline and tabline
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "AlphaReady",
		-- 	command = "set showtabline=0 | set laststatus=0",
		-- })

		-- Dynamic padding
		local section = dashboard.section
		local fn = vim.fn
		local config = dashboard.opts

		local marginTopPercent = 0.3
		local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

		config.layout = {
			{ type = "padding", val = headerPadding },
			section.header,
			{ type = "padding", val = 2 },
			section.buttons,
			section.footer,
		}

		alpha.setup(config)
	end,
}
