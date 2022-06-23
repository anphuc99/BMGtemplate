---@class protocol
local protocol = {}

---@param package_name string
---@param View View
---@param method function
function protocol:register(package_name, View,method)
    PackageHandlers.registerClientHandler(package_name,function (player,package)
        return method(View, package)
    end)
    Lib.subscribeEvent(package_name,function (package)
        method(View, package)
    end)
end

function protocol:subscribeUIEvent(package_name,UI,Event)
    UI[Event] = function ()
        Lib.emitEvent(package_name)
    end
end

PackageHandlers.registerClientHandler("PACKAGE_MAIN",function (player,package)
    Lib.emitEvent(package.protocol, package)
end)

return protocol