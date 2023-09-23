vim.g.mapleader = " "

local function split_buffer_n()
	vim.cmd(vim.v.count1 .. "sbuffer")
end

vim.cmd([[ colorscheme tokyonight-night ]])
builtin = require('telescope.builtin')

--[[ 
vim.keymap.set("n", "<Leader> ", function () builtin.find_files(require('telescope.themes').get_dropdown({})) end)
vim.keymap.set("n", "<Leader>l", function () builtin.live_grep(require('telescope.themes').get_dropdown({})) end)
vim.keymap.set("n", "<Leader>g", function () builtin.git_files(require('telescope.themes').get_dropdown({})) end)
--]] 
--
vim.keymap.set("n", "<Leader> ", builtin.find_files)
vim.keymap.set("n", "<Leader>l", builtin.live_grep)
vim.keymap.set("n", "<Leader>g", builtin.git_files)

vim.keymap.set("n", "<Leader>s", vim.cmd.split)
vim.keymap.set("n", "<Leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<Leader>q", vim.cmd.quit)
vim.keymap.set("n", "<C-h>", function () vim.cmd("noh") end)

--  vim.keymap.set("n", "<Leader>b", split_buffer_n, {silent =true})
