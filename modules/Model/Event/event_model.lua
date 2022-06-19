local class = require "modules.class.class"
local event_model = class()

event_model:create("event_model",function ()
    ---@class event_model
    local this = {}
    
    function this:__constructor(event)
        this.event = event
        this.list = {}    
        this.listCfg = {}    
    end
    
    function this:add(obj)
        table.insert(this.list, obj)
    end

    function this:delete(obj)
        for index, value in ipairs(this.list) do
            if value == obj then
                table.remove(this.list,index)
                break
            end
        end
    end
    
    function this:registerCfg(cfg,fcfg,func)
        local rs = table.find(cfg,this.listCfg)
        if not rs then
            table.insert(this.listCfg,cfg)
            for key, value in pairs(this.event) do
                Trigger.RegisterHandler(fcfg(cfg),key,function (context)
                    func(context,value)
                end)
            end
        end
    end
    
    return this
end)



return event_model