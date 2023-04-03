vim.cmd[[set number]]
-- open new split panes to right and below
vim.o.splitright = true
vim.o.splitbelow = true

-- turn terminal to normal mode with escape
vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", {})

-- start terminal in insert mode
vim.api.nvim_exec([[
  augroup TerminalAutoStart
    autocmd!
    autocmd BufEnter * if &buftype == 'terminal' | startinsert | endif
  augroup END
]], false)

-- open terminal on ctrl+n
function OpenTerminal()
  vim.api.nvim_command("split term://bash")
  vim.api.nvim_command("resize 10")
end

vim.api.nvim_set_keymap("n", "<c-n>", ":lua OpenTerminal()<CR>", {})

require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
