vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = {'*'},
    callback = function()
        if (vim.fn.winnr('$') == 1 and vim.fn.bufname() == 'NvimTree_'..vim.fn.tabpagenr())
        then
            vim.api.nvim_command('quit')
        end
    end
})

-- Remember line
vim.api.nvim_create_autocmd({'bufreadpost'}, {
    pattern = {'*'},
    callback = function()
        local line, column = unpack(vim.api.nvim_buf_get_mark(0, '"'))
        local line_count = vim.api.nvim_buf_line_count(0)

        if (line > 0 and line <= line_count - 1)
        then
            vim.api.nvim_buf_set_mark(0, '"', line, column, {})
        end
    end
})

vim.api.nvim_create_autocmd({'bufreadpost'}, {
    pattern = {'*'},
    callback = function()
        local line, column = unpack(vim.api.nvim_buf_get_mark(0, '"'))
        local line_count = vim.api.nvim_buf_line_count(0)

        if (line > 0 and line <= line_count - 1)
        then
            vim.api.nvim_win_set_cursor(0, {line, column})
        end
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"text", "markdown"},
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end
})

-- vim.api.nvim_create_autocmd({'UIEnter'}, {
--     pattern = {'*'},
--     callback = function()
--         if (vim.v.event.chan == 1)
--         then
--             require('gui')
--         end
--     end
-- })

vim.cmd [[
    au BufEnter *
            \ if &buftype=="quickfix" |
                \ if winbufnr(2) == -1 |
                \   quit! |
                \ endif |
            \ endif |
]]
