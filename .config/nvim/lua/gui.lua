vim.keymap.set('n', '<C-+>', require('zoom').zoom_in)
vim.keymap.set('n', '<C-=>', require('zoom').zoom_in)
vim.keymap.set('n', '<C-->', require('zoom').zoom_out)

vim.opt.mouse = 'a'

-- vim.opt.bg = 'light'
vim.cmd.colorscheme('melange')
