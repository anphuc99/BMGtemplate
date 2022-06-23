require "Controller.protocol"
local PlayerModel = require "Model.Player"
---@class sync
-- local sync = require ("modules.async.async"):new()

-- Trigger.addHandler(Entity.GetCfg("myplugin/player1"),"ENTITY_ENTER", function (context)
--     ---@class Player
--     sync.sync(function ()
--         local player = PlayerModel:new(context.obj1)
--         player:getDataSync(context.obj1.platformUserId,sync)

--     end)
-- end)