require "common.class"

---@class model 
local model = class("model")

function model:ctor(child)
    self.child = child
end

function model:sendController(package_name,package)
    Lib.emitEvent(package_name,self.child,package)
end

return model