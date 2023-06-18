-- vim: ft=lua :
require('options')

require('plugins')
require('autocmd')
require('keymaps')

-- Plugin configuration
require('plugin-config.lspconfig')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.marks')
require('plugin-config.gruvbox')
-- require('plugin-config.nvim-hardline')
-- require('plugin-config.galaxyline')

require('plugin-config.nvim-tree')
require('plugin-config.sandwich')

require('config')

if (vim.fn.has('gui_running') == 1)
then
    require('gui')
end
