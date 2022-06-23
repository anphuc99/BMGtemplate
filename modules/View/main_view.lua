local class = require "modules.class.class"
local View = require "modules.View.View"
local event_view = require "modules.View.event_view"

local main_view = class()


main_view:create("main_view", function()
    ---@class main_view : View
    local this = View:extend()

    local event

    function this:__constructor()
        event = event_view:new({
            EVENT_PLAYER_LOGIN = "onLogin"
        }, this)
        this:openUI()
    end

    return this
end)

return main_view