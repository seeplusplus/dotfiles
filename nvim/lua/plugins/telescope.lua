vim.g.mapleader = " "
builtin = require('telescope.builtin')

vim.keymap.set("n", "<Leader> ", builtin.find_files)
vim.keymap.set("n", "<Leader>l", builtin.live_grep)
vim.keymap.set("n", "<Leader>g", builtin.git_files)
