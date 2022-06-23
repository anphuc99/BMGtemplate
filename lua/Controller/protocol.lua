local protocol = require "modules.Cotroller.protocol"

---@class PlayerController
local PlayerController = require "Controller.PlayerController"

protocol:register(PackageHandlers.PLAYER_INIT,PlayerController,PlayerController.playerInit)
protocol:register(PackageHandlers.CONTROLLER_PLAYER_SETATRIBUTTE,PlayerController,PlayerController.setAtributte)