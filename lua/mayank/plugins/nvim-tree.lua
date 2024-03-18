return {
	'nvim-tree/nvim-tree.lua',
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
               -- arrow_closed = "󱞫", -- arrow when folder is closed
               -- arrow_open = "󱞫", -- arrow when folder is open
             },
           },
        },
				indent_markers = {
        	  			enable = true,
        	    		},
  			},
  			filters = {
    				dotfiles = true,
  			},
		})
	end,
}
