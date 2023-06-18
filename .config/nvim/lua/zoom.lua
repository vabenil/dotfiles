local M = {}

local def_size = 8.5

M.zoom_in = function()
    local gfont = vim.o.guifont
    local size, i = string.gsub(gfont, "^.*:h([^:]*).*$", "%1")
    size = tonumber(size)

    if (size == nil) then
        size = def_size
    end

    size = size + 0.5
    vim.o.guifont = string.gsub(gfont, ':h([^:]*)', ':h'..tostring(size))
end

M.zoom_out = function()
    local gfont = vim.o.guifont
    local size, i = string.gsub(gfont, "^.*:h([^:]*).*$", "%1")
    size = tonumber(size)

    if (size == nil) then
        size = def_size
    end

    size = size - 0.5
    vim.o.guifont = string.gsub(gfont, ':h([^:]*)', ':h'..tostring(size))
end

return M
