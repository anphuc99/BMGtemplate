---@class protocol
local protocol = {}

---@param package_name string
---@param controller string
function protocol:register(package_name,controller, method)
    PackageHandlers.registerServerHandler(package_name,function (player,package)
        local player = PlayerModel:getPlayer(player)
        return method(controller,player, package)
    end)
    Lib.subscribeEvent(package_name,function (player,package)
        Lib.pv(package)
        return method(controller,player, package)
    end)
end

return protocol