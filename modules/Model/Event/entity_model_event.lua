require "common.class"

---@class event_model
local event_model = require "modules.Model.Event.event_model"
---@class entity_model_event
local entity_model_event = class("entity_model_event",event_model)

function entity_model_event:ctor(event)
    entity_model_event.super:ctor(event)
end

function entity_model_event:registerCfg(cfg)
    self.super:registerCfg(cfg,Entity.GetCfg,function (context,event)
        print("mamamamama",#self.list)
        for index, obj in ipairs(self.list) do
            if obj.objID == context.obj1.objID then
                local func = obj[event]
                if func then
                    func(obj,context)
                end
            end
        end
    end)
end

return entity_model_event