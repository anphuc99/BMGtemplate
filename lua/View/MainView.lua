local class = require "modules.class.class"
local main_view = require "modules.View.main_view"

local MainView = class()

MainView:create("MainView",function ()
    ---@class MainView : main_view
    ---@class main_view
    local this, super = main_view:extend()

    function this:__constructor()
        this.UI = "Shop"
        super:__constructor()
    end

    ---@async    
    function this:onLogin()
        this.sync(function ()
            this:sendControllerAsync(PackageHandlers.PLAYER_INIT,{})
            local data = this.GetReturn()
            this:sendView(PackageHandlers.SEND_VIEW_TO_VIEW,data)
            this:display(data)
        end)
    end
    
    function this:display(package)
        local s = ""
        s = s.."name: "..package.name
        s = s.."money: "..package.money
        s = s.."mine: "..package.mine
        this.Win.Text:setText(s)        
    end

    return this
end)

local cls = MainView:new()

return cls