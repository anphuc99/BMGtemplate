local protocol = require "modules.Cotroller.protocol"

local PlayerController = require "Controller.PlayerController"

---@class PlayerController
local playerCon = PlayerController:new()

protocol:register(PackageHandlers.TEST_VIEW,playerCon.test)