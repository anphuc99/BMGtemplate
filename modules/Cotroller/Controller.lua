local class = require "modules.class.class"


local Controller = class()

Controller:create("Controller",function ()
    ---@class Controller
    local this = {}
    
    function this:send(player,view,package)
        PackageHandlers.sendServerHandler(player,view,package)
    end
    return this
end)


return Controller