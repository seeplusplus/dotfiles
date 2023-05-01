vim.g.mapleader = " "

local function split_buffer_n()
	vim.cmd(vim.v.count1 .. "sbuffer")
end
local builtin  = require('telescope.builtin')
vim.keymap.set("n", "<Leader> ", builtin.find_files)
vim.keymap.set("n", "<Leader>l", builtin.live_grep)
vim.keymap.set("n", "<Leader>g", builtin.git_files)
vim.keymap.set("n", "<Leader>b", split_buffer_n, {silent =true})
