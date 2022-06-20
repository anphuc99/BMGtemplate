local protocol = require "modules.Cotroller.protocol"

---@class PlayerController
local PlayerController = require "Controller.PlayerController"

protocol:register(PackageHandlers.TEST_VIEW,PlayerController.test)
protocol:register(PackageHandlers.SEND_VIEW_TO_CONTROLLER,PlayerController.viewSend)