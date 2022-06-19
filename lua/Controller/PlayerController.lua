local class = require "modules.class.class"
local Controller = require "modules.Cotroller.Controller"

local PlayerController = class()

PlayerController:create("PlayerController",function ()
    ---@class PlayerController : Controller
    local this,super = Controller:extend()
    
    function this:test(player,package)
        print("hahahaha", package.text)
    end
    
    return this
end)


return PlayerController