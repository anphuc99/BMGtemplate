local protocol = require "modules.Cotroller.protocol"

local PlayerController = require "Controller.PlayerController"

protocol:register(PackageHandlers.TEST_VIEW,PlayerController,PlayerController.test)