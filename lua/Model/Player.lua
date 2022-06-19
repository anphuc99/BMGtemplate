local class = require "modules.class.class"

local entity_model = require "modules.Model.entity_model"


local Player = class()

Player:create("player_model",function ()
    ---@class player_model : entity_model
    local this,super = entity_model:extend()
    
    function this:__constructor(obj)
        this.platformUserId = obj.platformUserId
        super:__constructor(obj,"myplugin/player1")
        PlayerModel:addPlayer(obj,this)
    end
    
    function this:onTouchPartBegin(context)
        print(this.platformUserId,"lololo")
        this:sendController(PackageHandlers.TEST_VIEW,{text = "mamama"})
    end

    function this:onLeave()
        this:__destructor()
    end

    
    return this
end)


return Player