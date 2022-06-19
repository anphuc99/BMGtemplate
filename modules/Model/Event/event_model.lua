require "common.class"

---@class event_model
local event_model = class("event_model")

function event_model:ctor(event)
    self.event = event
    self.list = {}    
    self.listCfg = {}    
end

function event_model:add(obj)
    table.insert(self.list, obj)
end

function event_model:registerCfg(cfg,fcfg,func)
    local rs = table.find(cfg,self.listCfg)
    if not rs then
        table.insert(self.listCfg,cfg)
        for key, value in pairs(self.event) do
            Trigger.RegisterHandler(fcfg(cfg),key,function (context)
                func(context,value)
            end)
        end
    end
end

return event_model