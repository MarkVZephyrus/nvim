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
      -- dashboard.button("S", "", "<cmd>SessionRestore<CR>"),
    }

    -- local fortune = require("alpha.fortune") -- not as fun as the startify cow
    dashboard.section.footer.val = "🌕 Try not to config. 🌑" -- fortune()

    -- alpha.setup(require("alpha.themes.startify").config)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    -- hide statusline and tabline
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      command = "set showtabline=0 | set laststatus=0",
    })
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      command = "set showtabline=2 | set laststatus=3", -- laststus 3 is important for the statusline to be common among windows.
    })

    -- Hide cursor when in Alpha buffer. Downside is that you cannot see the cursor in another pane such as Nvim tree
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      desc = "hide cursor for alpha",
      callback = function()
        local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
        hl.blend = 100
        vim.api.nvim_set_hl(0, "Cursor", hl)
        vim.opt.guicursor:append("a:Cursor/lCursor")
      end,
    })
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      desc = "show cursor after alpha",
      callback = function()
        local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
        hl.blend = 0
        vim.api.nvim_set_hl(0, "Cursor", hl)
        vim.opt.guicursor:remove("a:Cursor/lCursor")
      end,
    }) -- Dynamic padding
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
