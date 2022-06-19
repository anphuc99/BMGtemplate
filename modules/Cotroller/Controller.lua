require "common.class"

---@class Controller 
local Controller = class("Controller")

function Controller:ctor(child)
    self.child = child
end

function Controller:send(player,view,package)
    PackageHandlers.sendServerHandler(player,view,package)
end

return Controller