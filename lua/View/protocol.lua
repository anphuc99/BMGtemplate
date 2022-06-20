local protocol = require "modules.View.protocol"

---@class ShopView
local ShopView = require "View.ShopView"

protocol:register(PackageHandlers.SEND_CONTROLLER_TO_VIEW,ShopView.controllerSend)
protocol:register(PackageHandlers.SEND_VIEW_TO_VIEW,ShopView.viewSend)