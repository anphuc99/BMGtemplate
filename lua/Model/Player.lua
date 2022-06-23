local class = require "modules.class.class"

local player_model = require "modules.Model.player_model"


local Player = class()

Player:create("Player",function ()
    ---@class Player : player_model
    local this,super = player_model:extend()
    
    local name
    local mine
    local money

    this:get("name",function ()
        return name
    end)

    this:set("name",function (value)
        name = value
    end)

    this:get("mine",function ()
        return mine
    end)

    this:set("mine",function (value)
        mine = value
    end)

    this:get("money",function ()
        return money
    end)

    this:set("money",function (value)
        money = value
    end)
    
    this.atributtes = {
        "name",
        "mine",
        "money"
    }
    


    function this:__constructor(obj)
        super:__constructor(obj)
    end
    


    return this
end)


return Player