local class = require "modules.class.class"

local model = class()

model:create("model",function ()
    ---@class model
    local this = {}
    
    function this:sendController(package_name,package)
        Lib.emitEvent(package_name,this,package)
    end


    return this
end)


return model