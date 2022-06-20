---@class protocol
local protocol = {}

---@param package_name string
---@param controller any
function protocol:register(package_name, controller)
    PackageHandlers.registerServerHandler(package_name,function (player,package)
        local player = PlayerModel:getPlayer(player)
        return controller(nil,player, package)
    end)
    Lib.subscribeEvent(package_name,function (player,package)
        controller(nil,player, package)
    end)
end

return protocol