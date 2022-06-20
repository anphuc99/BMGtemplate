---@class protocol
local protocol = {}

---@param package_name string
---@param View any
function protocol:register(package_name, View)
    PackageHandlers.registerClientHandler(package_name,function (player,package)
        return View(nil, package)
    end)
    Lib.subscribeEvent(package_name,function (package)
        View(nil, package)
    end)
end

function protocol:subscribeUIEvent(package_name,UI,Event)
    UI[Event] = function ()
        Lib.emitEvent(package_name)
    end
end

return protocol