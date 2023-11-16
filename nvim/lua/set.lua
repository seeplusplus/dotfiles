vim.g.mapleader = " "

local function split_buffer_n()
	vim.cmd(vim.v.count1 .. "sbuffer")
end

vim.opt.rnu = true
vim.g.editorconfig = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Leader>w", vim.cmd.write)
vim.keymap.set("n", "<Leader>s", vim.cmd.split)
vim.keymap.set("n", "<Leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<Leader>q", vim.cmd.quit)
vim.keymap.set("n", "<Leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<C-h>", function () vim.cmd("noh") end)

