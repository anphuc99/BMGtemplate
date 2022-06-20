local class = require "modules.class.class"
local Controller = require "modules.Cotroller.Controller"

local PlayerController = class()

PlayerController:create("PlayerController",function ()
    ---@class PlayerController : Controller
    local this,super = Controller:extend()
    
    function this:test(player,package)
        print("lololo")
        this:sendView(player,PackageHandlers.SEND_CONTROLLER_TO_VIEW,{text = "mamama"})
    end
    
    function this:viewSend(player, packet)
        print("co ne nha", player.Object.name)
    end

    return this
end)

local cls = PlayerController:new()
return cls