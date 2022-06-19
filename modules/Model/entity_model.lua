require "common.class"
--- @class entity_model_event
local entity_model_event = require "modules.Model.Event.entity_model_event"

---@class model
local model = require "modules.Model.model"

--- @class entity_model : model
local entity_model = class("entity_model", model)

local event = entity_model_event.new({
    ENTITY_ENTER = "onEnter",
    ENTITY_TOUCH_PART_BEGIN = "onTouchPartBegin"
})

function entity_model:ctor(child,obj,cfg)
    self.cfg = cfg
    self.objID = obj.objID
    self.super:ctor(child)
    event:add(child)
    event:registerCfg(cfg)
end

return entity_model