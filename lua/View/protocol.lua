local protocol = require "modules.View.protocol"
---@class MainView
local MainView = require "View.MainView"

---@class ShopView
local ShopView = require "View.ShopView"

protocol:register(PackageHandlers.SEND_CONTROLLER_TO_VIEW,ShopView,ShopView.controllerSend)
protocol:register(PackageHandlers.SEND_VIEW_TO_VIEW,ShopView,ShopView.viewSend)
protocol:register(PackageHandlers.VIEW_PLAYER_SETATRIBUTTE,ShopView,ShopView.setAtributte)
protocol:register(PackageHandlers.VIEW_PLAYER_DISPLAY_INFO,ShopView,MainView.display)