local class = require "modules.class.class"

local entity_model = require "modules.Model.entity_model"


local player_model = class()

player_model:create("player_model",function ()
    ---@class player_model : entity_model
    local this,super = entity_model:extend()
    
    function this:__constructor(obj)
        this.platformUserId = obj.platformUserId
        super:__constructor(obj,"myplugin/player1")
        local player = PlayerModel:getPlayer(obj)
        if player then
            this = player
        else
            PlayerModel:addPlayer(obj,this)
        end
    end

    function this:onLeave()
        this:__destructor()
    end    

    function this:save()
        super:save()
        local data = {}
        for index, value in ipairs(this.atributtes) do
            data[value] = this[value]
        end
        this.Object:setValue("player",data)
    end
    
    return this
end)


return player_model