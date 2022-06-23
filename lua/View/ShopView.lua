local class = require "modules.class.class"
local View = require "modules.View.View"
local ShopView = class()

ShopView:create("ShopView",function ()
    ---@class ShopView : View
    local this = View:extend()    
    
    function this:__constructor()
        this.UI = "login"
        -- this:openUI()
    end
    
    function this:controllerSend(package)
        this.Win.Text:setText(package.text)
    end
    
    function this:viewSend(package)
        this:openUI()
        this.Win.name:setText(package.name)
        this.Win.money:setText(package.money)
        this.Win.mine:setText(package.mine)
    end

    function this:setAtributte()
        this.sync(function ()
            local package = {
                name = this.Win.name:getText(),
                mine = this.Win.mine:getText(),
                money = this.Win.money:getText(),
            }
            this:sendControllerAsync(PackageHandlers.CONTROLLER_PLAYER_SETATRIBUTTE,package)            
            this:sendView(PackageHandlers.VIEW_PLAYER_DISPLAY_INFO,package)
        end)
    end

    return this
end)

local cls = ShopView:new()
return cls