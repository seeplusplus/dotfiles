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

require('plugins')
require('set')
require('tokyo')
require('lsp')

local cmp = require 'cmp'
cmp.setup {
  snippet = {
  expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body)
    end
  },
  sources = cmp.config.sources({
  { name = 'nvim_lsp' },
    { name = 'ultisnips' }
  }, {
    { name = 'buffer' }
  })
}

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "elixir" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}
