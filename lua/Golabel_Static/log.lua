local Log = {}

local config = {
    file = "D:\\log.txt"
}

local function writeFile(...)
    local s = "["..os.date("%c",os.time()).."]: "
    local arg = {...}
    for key, value in pairs(arg) do
        if type(value) == "table" then
            if value.__cname then
                s = s..value.__cname.."\t"..Lib.v2s(value)
            else
                s = s.."\t"..Lib.v2s(value)
            end            
            Lib.pv(value,nil,value.__cname)
        else
            s = s.."\t"..tostring(value)
        end
    end    
    s=s.."\n"
    local file = io.open(config.file,"a+")
    file:write(s)
    file:close()    
end
function Log:__call(...)
    print(...)
    writeFile(...)
end

function Log:__index(key)
    return rawget(Log,key)
end

function Log:error(error)
    Lib.logError(error)
    writeFile("[error]:",error)
end

rawset(_G,"log", setmetatable({},Log))