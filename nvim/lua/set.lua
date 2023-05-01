local builtin  = require('telescope.builtin')

-- settings
vim.opt.rnu = true

-- keys
vim.g.mapleader = " "

vim.keymap.set("n", "<Leader> ", builtin.find_files)
