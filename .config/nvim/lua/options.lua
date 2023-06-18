-- vim.opt.guifont = "Hermit:h10"
vim.g.gui_fontsize = 8
vim.opt.guifont = "JetBrains Mono:h"..vim.g.gui_fontsize
vim.opt.undofile = true
vim.opt.undodir = vim.env["HOME"].."/.config/nvim/undo"

-- vim.opt.showcd = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.undolevels = 256
vim.opt.undoreload = 256

vim.opt.lazyredraw = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- vim.opt.hidden = true
-- vim.opt.title = true
-- vim.opt.titleold = true

vim.opt.relativenumber = true
vim.opt.number = true

-- vim.opt.coneallevel = 0
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4 
vim.opt.expandtab = true

vim.opt.ffs="unix"
vim.opt.fileencoding="utf-8"
-- vim.opt.listchars = "eol:¬,tab:.. "
vim.opt.listchars = "eol:¬,tab:.."
vim.opt.list = true

vim.opt.conceallevel = 2

vim.o.laststatus = 3 -- Global statusline

vim.g.vim_markdown_folding_disabled = 1
vim.g.mkdp_browser = "vimb"

-- gui colors
vim.opt.termguicolors = true
