local class = require("modules.class.class")

local event_view = class()

event_view:create("event_view",function ()
    ---@class event_view
    local this = event_view:this()
    
    function this:__constructor(event,obj)       
        print("lololo") 
        for key, value in pairs(event) do
            Lib.subscribeEvent(Event[key],function (...)
                local func = obj[value]
                if func then
                    func(...)
                end
            end)            
        end        
    end

    return this
end)

return event_view