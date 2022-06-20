local class = require "modules.class.class"


local Controller = class()

Controller:create("Controller",function ()
    ---@class Controller
    local this = {}
    
    function this:sendView(player,view,package)        
        PackageHandlers.sendServerHandler(player.Object,view,package)
    end

    function this:sendController(package_name,player,package)
        Lib.emitEvent(package_name,player,package)
    end

    return this
end)


return Controller