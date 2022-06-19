require "common.class"

---@class Controller
local Controller = require "modules.Cotroller.Controller"

---@class PlayerController : Controller
local PlayerController = class("PlayerController",Controller)

function PlayerController:ctor()
    self.super:ctor(self)
end

function PlayerController:test(player,package)
    print("hahahaha", package.text)
end

return PlayerController