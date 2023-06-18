local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Colorschemes
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'sainnhe/vim-color-forest-night'
Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'savq/melange-nvim'

-- Status line
Plug 'nvim-lualine/lualine.nvim'
-- Plug 'ojroques/nvim-hardline'
-- Plug('glepnir/galaxyline.nvim', {branch='main'})

-- Syntax
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'

-- NOTE:
-- Post hook not working
Plug('iamcco/markdown-preview.nvim', {
    ['do'] = function() vim.fn["mkdp#util#install"]() end
})
Plug 'Sirsireesh/vim-dlang-phobos-highlighter'

Plug 'Yggdroot/indentLine'

-- better marks, signature replacement
Plug 'chentoast/marks.nvim'

Plug 'godlygeek/tabular'
Plug 'b4winckler/vim-angry'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'


Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
-- Plug('Yggdroot/LeaderF', { ['do'] = function() vim.api.nvim_command('LeaderfInstallCExtension') end})
-- Plug('liuchengxu/vim-clap', {
--     ['do'] = function()
--         vim.api.nvim_command('Clap install-binary!')
--     end
-- })

Plug 'kyazdani42/nvim-web-devicons' -- for file icons
Plug 'kyazdani42/nvim-tree.lua'

-- Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'

-- Like goyo
-- Plug 'Pocco81/true-zen.nvim'
Plug 'folke/zen-mode.nvim'

vim.call('plug#end')
