--- @param find any
---@param list table
function table.find(find, list) -- find element v of l satisfying f(v)
    for _, v in ipairs(list) do
        if find == v then
            return v
        end
    end
    return nil
end