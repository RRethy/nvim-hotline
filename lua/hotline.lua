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
        table.insert(line, string.format([[%%{luaeval("require('hotline')._callback(%d)")}]], #M.callbacks))
    else
        table.insert(line, tostring(segment))
    end
    return line
end

function M._callback(id)
    return M.callbacks[id]()
end

function M.format(segment)
    return table.concat(format({}, segment))
end

return M
