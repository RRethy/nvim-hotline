local strfmt = string.format

local M = {}

M.callbacks = {}

local function format(line, segment)
    local spec_type = type(segment)
    if spec_type == 'table' then
        for _, subseg in ipairs(segment) do
            format(line, subseg)
        end
    elseif spec_type == 'function' then
        table.insert(M.callbacks, segment)
        table.insert(line, strfmt([[%%{luaeval("require('hotline').callback(%d)")}]], #M.callbacks))
    else
        table.insert(line, tostring(segment))
    end
    return line
end

function M.callback(id)
    return M.callbacks[id]()
end

function M.format(segment)
    return table.concat(format({}, segment))
end

function M.statusline(line)
    M._statusline = line
    vim.o.statusline = [[%!luaeval("require('hotline').format(require('hotline')._statusline)")]]
end

function M.tabline(line)
    M._tabline = line
    vim.o.tabline = [[%!luaeval("require('hotline').format(require('hotline')._tabline)")]]
end

return M
