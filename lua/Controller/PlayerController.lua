local class = require "modules.class.class"
local Controller = require "modules.Cotroller.Controller"
local Player_Model = require "Model.Player"

local PlayerController = class()

PlayerController:create("PlayerController",function ()
    ---@class PlayerController : Controller
    local this,super = Controller:extend()
    
    function this:playerInit(player,package)
        this.sync(function ()
            ---@class Player
            local playerModel = Player_Model:new(player)
            playerModel:getDataSync(player.platformUserId,this)
            player:setValue("player",playerModel:toTable())
            this.Return(playerModel:toTable(),"hahahaha")
        end)
        return Lib.ASYNC
    end

    function this:setAtributte(player,package)
        ---@class Player
        local Player = PlayerModel:getPlayer(player)
        Player.name = package.name
        Player.money = package.money
        Player.mine = package.mine
        Player:save()
    end

    return this
end)

local cls = PlayerController:new()
return cls