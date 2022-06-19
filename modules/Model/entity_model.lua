local class = require "modules.class.class"
local entity_model_event = require "modules.Model.Event.entity_model_event"

local model = require "modules.Model.model"

local entity_model = class()

--- @class entity_model_event
local event = entity_model_event:new({
    ENTITY_ENTER = "onEnter",
    ENTITY_TOUCH_PART_BEGIN = "onTouchPartBegin",
    ENTITY_LEAVE = "onLeave"
})


entity_model:create("entity_model",function ()
    ---@class entity_model : model 
    local this = model:extend()

    function this:__constructor(obj,cfg)
        this.cfg = cfg
        this.objID = obj.objID
        event:add(this)
        event:registerCfg(cfg)
    end

    function this:__destructor()
        event:delete(this)
        this = nil
    end
    return this
end)

return entity_model