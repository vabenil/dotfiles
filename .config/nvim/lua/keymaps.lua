function win_resize(cols, rows)
    local width = vim.api.nvim_win_get_width(0)
    local height = vim.api.nvim_win_get_height(0)

    vim.api.nvim_win_set_width(0, width + cols)
    vim.api.nvim_win_set_height(0, height + rows)
end

opts = {noremap=true, silent=true}

-- Terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-^>', 'C-\\><C-n>')

-- Normal mode
vim.keymap.set('n', 'Y', 'y$')

vim.keymap.set('n', 'gy', '"+y')
vim.keymap.set('n', 'gY', '"+y$')

vim.keymap.set('n', 'gp', '"+p')
vim.keymap.set('n', 'gP', '"+P')

vim.keymap.set('n', '-', function() win_resize(-2, 0) end)
vim.keymap.set('n', '+', function() win_resize(2, 0) end)

vim.keymap.set('n', 'g-', function() win_resize(0, -2) end)
vim.keymap.set('n', 'g+', function() win_resize(0, 2) end)

vim.keymap.set('n', '<C-+>',
    function()
        vim.opt.guifont = ""
    end
)

-- Split & Tabs
vim.keymap.set('n', '<space>sn', ':new<cr>', opts)
vim.keymap.set('n', '<space>vn', ':vnew<cr>', opts)
vim.keymap.set('n', '<space>tn', ':tabnew<cr>', opts)

vim.keymap.set('n', '<space>ss', ':new<cr>', opts)
vim.keymap.set('n', '<space>vs', ':vnew<cr>', opts)
vim.keymap.set('n', '<space>ts', ':tabnew<cr>', opts)

vim.keymap.set('n', '<space>st', ':botright sp term://bash<cr>', opts)
vim.keymap.set('n', '<space>vt', ':vsp term://bash<cr>', opts)
vim.keymap.set('n', '<space>tt', ':tab sp term://bash<cr>', opts)

vim.keymap.set('n', '<space>F', ':tab sp', opts)

-- TODO: rewrite this in lua
vim.cmd [[
noremap <expr> <space>cc ":".(len(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))?"cclose":"copen")." \| wincmd p<cr>"
]]

-- TODO: don't forget easymotion is kind of cool
-- vim.keymap.set('n', '<space>f',
--     function()
--         vim.api.nvim_command('NvimTreeToggle')
--     end
-- )
local api = require('nvim-tree.api')
vim.keymap.set('n', '<space>f', api.tree.toggle)
vim.keymap.set('n', 'gf', 'viWgf')

vim.keymap.set('n', 'ZW', ':w<cr>', opts)
vim.keymap.set('n', '<space>w', ':w<cr>', opts)
vim.keymap.set('n', '<space>no', ':noh<cr>', opts)

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>f', require('telescope.builtin').live_grep)
-- vim.keymap.set('n', '<C-p>', '<cmd>Clap files .<cr>')

vim.keymap.set('n', '<leader>s', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>N', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist)
