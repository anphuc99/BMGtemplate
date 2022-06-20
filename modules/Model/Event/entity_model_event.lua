local class = require "modules.class.class"

local event_model = require "modules.Model.Event.event_model"
local entity_model_event = class()


entity_model_event:create("entity_model_event",function ()
    ---@class entity_model_event : event_model
    ---@class event_model
    local this,super = event_model:extend()
    
    function this:registerCfg(cfg)
        super:registerCfg(cfg,Entity.GetCfg,function (context,event)
            for index, obj in ipairs(this.list) do
                if obj.objID == context.obj1.objID then
                    local func = obj[event]
                    if func then
                        func(obj,context)                    
                    end
                end
            end
        end)
    end
    
    
    return this
end)


return entity_model_event