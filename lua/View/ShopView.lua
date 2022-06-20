local class = require "modules.class.class"
local View = require "modules.View.View"
local ShopView = class()

ShopView:create("ShopView",function ()
    ---@class ShopView : View
    local this = View:extend()
    
    function this:__constructor()
        this.UI = "Shop"
        this:openUI()
    end
    
    function this:controllerSend(package)
        print("co nha", package.text) 
        this.Win.Text:setText(package.text)
    end
    
    function this:viewSend()
        print("co nha")
        this.Win.Text:setText("click")
        this:sendController(PackageHandlers.SEND_VIEW_TO_CONTROLLER)
    end

    return this
end)

local cls = ShopView:new()
return cls