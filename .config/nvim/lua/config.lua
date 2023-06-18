-- General settings
vim.cmd [[
    syntax enable
    set bg=dark
    colorscheme everforest

    highlight ColorColumn ctermbg=magenta guifg=magenta
    call matchadd('ColorColumn', '\%81v', 89)
]]
