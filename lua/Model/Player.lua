local class = require "modules.class.class"

local player_model = require "modules.Model.player_model"


local Player = class()

Player:create("Player",function ()
    ---@class Player : player_model
    local this,super = player_model:extend()
    
    function this:__constructor(obj)
        super:__constructor(obj)
    end
    
    function this:onTouchPartBegin(context)
        this:sendController(PackageHandlers.TEST_VIEW,{text = "mamama"})
    end

    function this:onInit()
        super:onInit()
    end

    return this
end)


return Player