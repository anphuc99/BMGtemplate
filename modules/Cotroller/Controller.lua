local class = require "modules.class.class"
local async = require "modules.async.async"


local Controller = class()

Controller:create("Controller",function ()
    ---@class Controller : async
    local this = async:extend()

    local protocol = ""
    
    function this:sendView(player,view,package)        
        PackageHandlers.sendServerHandler(player.Object,view,package)
    end

    function this:sendController(package_name,player,package)
        Lib.emitEvent(package_name,player,package)
    end

    this:get("protocol",function ()
        return protocol
    end)

    this:set("protocol",function (value)
        protocol = value
    end)

    return this
end)


return Controller