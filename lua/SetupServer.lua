---@class PlayerModel
local PlayerModel = require "Model.Player"

Trigger.addHandler(Entity.GetCfg("myplugin/player1"),"ENTITY_ENTER", function (context)
    local player = PlayerModel.new(context.obj1)
end)