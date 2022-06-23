---@class protocol
local protocol = {}

---@param package_name string
---@param controller Controller
---@param method function
function protocol:register(package_name, controller, method)
    PackageHandlers.registerServerHandler(package_name,function (player,package)
        if package.protocol then
            controller.protocol = package.protocol
            local agr = table.pack(method(controller,player, package))
            if agr[1] == Lib.ASYNC then
                local can = {}            
                local cancel,index = Lib.subscribeEvent(package.protocol,function (...)
                    local data = {...}
                    data.protocol = package.protocol
                    PackageHandlers.sendServerHandler(player,"PACKAGE_MAIN",data)
                    can:cancel()
                end) 
                function can:cancel()
                    cancel()
                end              
            else            
                agr.protocol = package.protocol
                PackageHandlers.sendServerHandler(player,"PACKAGE_MAIN",agr)
            end
        else
            return method(controller,player, package)
        end
    end)
    Lib.subscribeEvent(package_name,function (player,package)
        method(controller,player, package)
    end)
end

return protocol